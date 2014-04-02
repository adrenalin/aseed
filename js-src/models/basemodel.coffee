define [], () ->
  class Basemodel
    _fields:
      id: null
    
    _namespace: {}
    
    constructor: (opts = null) ->
      @_fields.id = null
      for k, v in @_fields
        @[k] = null
      
      unless opts then opts = {}
      @setValues(opts)
      
      @getFormData = ->
        formData = {}
        
        for k, v of @_fields
          if @[k] instanceof Basemodel and typeof @[k].getFormData is 'function'
            formData[k] = @[k].getFormData()
          else if @[k] instanceof Array
            formData[k] = []
            
            for i in [0...@[k].length]
              if typeof @[k][i].getFormData is 'function'
                formData[k].push @[k][i].getFormData()
              else
                formData[k].push @[k][i]
          else
            formData[k] = @[k]
        
        return formData
          
    
    setValues: (values = null) ->
      try
        for k, v of @_fields
          if v is null
            v = ''
          
          key = v.toString().split(':')
          
          if typeof values[k] is 'undefined'
            if key[0] is 'Array'
              values[k] = []
            else
              values[k] = null
          
          if key[0] is 'Array'
            @[k] = []
            if key[1] is 'Object'
              className = key[2]
              
              for i in [0...values[k].length]
                value = values[k][i]
                obj = new @_namespace[className](value)
                @[k].push obj
            else
              @[k] = values[k]
          else if key[0] is 'Object'
            className = key[1]
            value = values[k]
            @[k] = new @_namespace[className](value)
          else
            @[k] = values[k]
      catch error
        console.error error.toString()
    
    getNavigation: ->
      return []
