
Path = require 'path'
fs = require 'fs-extra'
$ = require 'jquery'
_ = require 'underscore'

require 'coffee-script/register'

# node.js will not allow us to require something from the user app's dir, so
# copy it to bumble-test root 
for confFile in ["bumbleDocs.coffee", "bumbleDocs.js"]
  if fs.existsSync(confFile)
    # console.log "copying #{confFile} to node_modules/bumble-test"
    fs.copySync(confFile, "node_modules/bumble-test/" + confFile)

# ... and require it from there
configFile = require('./bumbleDocs') # copied from the user app's root dir

global.EXAMPLES_METADATA = configFile.examples


###


###
module.exports = class TestExamples 
  
  constructor: (options={}) ->
    @options = _.defaults options,
      # specify additional scripts to load relative to your project root. Note that
      # if a package named dist/#{package.json:name}.js exists, that is added automatically
      addScripts: []
      verbose: false
      
    
  
  # this is a suboptimal way of doing this.  I also tried and failed when using:
  #  - a script tag with a src,  no way to load it synchrously or detect it's load
  #  - wrapping this in another jsDom.env  - i think it ignores if already in a jsDom.env
  #
  # It dumps the whole contents of the scrips and the compiled example into
  # static script tags in the dom and that makes the code instantly load and run
  # and at this point we can be assured that we are fully loaded
  loadExample: (exampleScriptFile, done) ->
    # example files all expect to find an element with the id='demo' where they do 
    # their rendering
    html = """
      <div id="demo"></div>
      #{@_renderScriptTags()}
      <script id="exampleScript">
        #{@_getSourceCode(exampleScriptFile)}
        ReactDOM.render(React.createElement(window.Demo), document.getElementById('demo'))
      </script>
    """
    $('body').html(html)
    
    #console.log "woohoo", @_getSourceCode(exampleScriptFile) #$('#exampleScript').html()
    
    done()


  testExample: (exampleFile) ->
    describe "Example: #{exampleFile}", =>
      it 'should render something', (done) =>
        @loadExample exampleFile, ->
          #console.log $('#demo').html()
          $('#demo').html().should.not.equal ""
          done()
        

  testAllExamples: (exampleDir='docs/examples') ->
    for demo in configFile.examples.demos
      # all coffee and jsx get compiled to .js
      path = demo.path.replace(/(\.jsx|\.coffee|\.cjsx)/, '.js')
      @testExample(Path.join(exampleDir, path)) 
    
  
  _renderScriptTags: () ->
    scripts = @options.addScripts.concat([])
    npmPackage = JSON.parse(fs.readFileSync('package.json'))
    userDist = "dist/#{npmPackage.name}.js"
    scripts.push(userDist) if fs.existsSync(userDist) && userDist not in scripts
    
    scriptTags = for script in scripts
      console.log "adding script tag for #{script}" if @options.verbose
      "<script>#{@_getSourceCode(script)}</script>"
    
    return scriptTags.join('\n')
      
      
  _getSourceCode: (script) ->
    src = fs.readFileSync(script).toString()
    # use strict seems to mess with JSDOM (or our code isn't strict enough (fu u pedantic f's))
    return src.replace('"use strict";', '')
  
  