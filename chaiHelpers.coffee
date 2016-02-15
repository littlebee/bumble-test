Chai = require('chai');
_ = require('underscore')

Chai.use (chai) ->
  
  chai.Assertion.addMethod 'toHaveKnownValues', (expected) ->
    actual = @_obj
    
    @assert(actual?, "toHaveKnownValues Expected actual to exist")
    
    actual = [actual] unless _.isArray(actual)
    expected = [expected] unless _.isArray(expected)
    for oneExpected in expected
      #console.log actual
      found = false
      for oneActual in actual
        noMatch = false
        for key, value of oneExpected
          noMatch = oneActual[key] != value
          if noMatch
            # console.log "stopped on ", key, oneActual[key], value
            break 
        
        unless noMatch 
          found = true
          break;

      @assert(found, 
        "Expected to find\n#{JSON.stringify(oneExpected)}\n in \n#{JSON.stringify(actual)}",
        "Expected to not find\n#{JSON.stringify(oneExpected)}\n in \n#{JSON.stringify(actual)}",
        oneExpected,
        actual
      )

  
  