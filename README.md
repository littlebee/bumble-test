# bumble-test
A test runner setup for running Mocha + Chai + Sinon + JsDom that will proabably not work with your code. 

This is the test runner script I built with help from some really great packages like Mocha, Chai, Sinon and jsDom.  You should need to require any of the above dependencies in your project.  Just provide bin/testRunner.coffee with the path where it can find your tests

Currently works with tests written in plain ES5 javascript, coffeescript and cjsx

Run node_modules/bumble-test/bin/init from the command line to create shortcut scripts in <yourProjectRoot>/scripts.
The runTest and debugTest can accept a file glob so you can test one or a directory of scripts like this:
```bash
scripts/runTest test/myAwesomeTest.coffee
```

The scrits/debugTest shortcut script will load the test(s) with Node.js args to load in [node-inspector](https://github.com/node-inspector/node-inspector). 
