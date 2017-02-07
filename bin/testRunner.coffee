#!/usr/bin/env coffee

console.log 'Loading test system...'
HELP = """
script for running the tests from the debugger

usage:
```bash
node_modules/bumble-test/bin/testRunner.coffee tests/**/*
```

The only required parameter is a glob for the path to run tests from.  Can also be the path of
a single test to run and can be run in the node-inspector.
"""

path = require('path')
fs = require('fs')
glob = require('glob')

Mocha = require('mocha')
_ = require('underscore')

require('coffee-react/register') #  jit compile .coffee and .cjsx on require
#require('node-cjsx').transform()


testOptions = require('commander')
.option('--verbose', 'I like lots of output')
.on '--help', ->
  console.log HELP
  return
.usage('[options] [optional .coffee file paths of tests to run...]')
.parse(process.argv)


# we load these globally so we don't have to repeat ourselves in every test
global.chai =  require("chai")
global.assert = chai.assert
global.should = chai.should()     # TODO : figure out why calling .should() instead of passing ref
global.expect = chai.expect

chai.config.includeStack = true   # need stack on exceptions

jsdom = require("jsdom");

jsdom.defaultDocumentFeatures = { 
    FetchExternalResources   : ['script'],
    ProcessExternalResources : ['script'],
    MutationEvents           : '2.0',
};

jsdom.env '<html><body><div id="testBody"></div></body></html>', [], (err, window) ->
  global.window = window
  global.document = window.document
  global.navigator = window.navigator

  # bootstrap and others expect jquery to be in window
  #window.jQuery = window.$ = global.jQuery

  # TODO : this is probably unneccessary for this package, i don't think we use localStorage anywhere
  # simulate browser localStorage
  global.localStorage = window.localStorage = {}

  # all tests can just say  if(testOptions.verbose)
  global.testOptions = _.defaults testOptions || {},
    verbose: false

  # adds spies, mocks and other  see http://sinonjs.org/docs/
  # and http://chaijs.com/plugins/sinon-chai  for chai expectation
  global.sinon = require('sinon')
  global.chaiSinon = require('sinon-chai')
  global.chai.use(chaiSinon)

  # adds should.trigger semantics  http://chaijs.com/plugins/chai-backbone
  chaiBackbone = require("chai-backbone");
  chai.use(chaiBackbone);

  # add when and other change detection tests
  chaiChanges = require("chai-changes");
  chai.use(chaiChanges)
  
  # adds some handy assertions like toHaveKnownValues 
  require '../chaiHelpers'
  
  coffeeCov = require 'coffee-coverage'
  
  coffeeCov.register({
      instrumentor: 'istanbul',
      basePath: './src'
      initAll: true
  });


  # if  this is found at the top of the file it is ignored when running from the command line
  BROWSER_ONLY_ANNOTATION = '#@browserOnly'

  mochaOptions = 
    reporter: 'spec'
    ui: 'bdd'
    timeout: 999999
    useColors: true
        
  mocha = new Mocha(mochaOptions)

  processFile = (file) ->
    # ignore our test/lib dir
    return if path.extname(file) not in ['.coffee', '.cjsx', '.js'] || file.match(/\/lib\//g)

    fileContents = fs.readFileSync(file)
    if fileContents.slice(0, BROWSER_ONLY_ANNOTATION.length) == BROWSER_ONLY_ANNOTATION
      console.log 'Skipping browser only tests in ' + file
      return

    if testOptions.verbose
      console.log 'adding test file: %s', file

    mocha.addFile file
    return


  runMocha = ()->
    require("babel-core/register")({
      "presets": [ "react", "es2015" ]
      "ignore": (fileName) -> 
        truth = path.extname(fileName).toLowerCase() in ['.cjsx', '.coffee'] ||
          (fileName.match(/\/node_modules\/.*/) && 
           !fileName.match(/\/node_modules\/react-select.*/) )
        #console.log fileName, truth
        return truth
    })
    passingCount = 0
    failingCount = 0
    
    runner = mocha.run ->
      console.log "finished with #{failingCount} failures"
      process.exit(failingCount)
      return
    
    runner.on 'pass', (test) ->
      passingCount++
      return
    
    runner.on 'fail', (test) ->
      failingCount++
      return
    
    return

  console.log 'Running tests...'
  
  testDir = if testOptions.args.length > 0
    testOptions.args[0]
  else
    './test/**/*'
  
  files = glob.sync(testDir, nodir: true)
  files.forEach processFile
  runMocha()
  

