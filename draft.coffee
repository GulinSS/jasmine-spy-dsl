$bx = ->
  env = jasmine.getEnv()

  _.tap {}, (result) ->
    _.extend result,
      spy: (fn) ->
        _.tap jasmine.createSpy(), (spy) ->
          env.beforeEach ->
            spy.reset()
            value = fn?()
            if value?
              valueToReturn = if value.promise? then value.promise else value
              spy.$bxResult = value
              spy.andReturn valueToReturn

      spies: ->
        names = arguments
        _.tap {}, (o) ->
          _.each names, (name) -> o[name] = result.spy()

