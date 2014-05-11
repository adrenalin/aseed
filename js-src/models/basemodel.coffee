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
    
    typecast: (value, type) ->
      # Typecasting
      switch type
        when 'Number'
          if value then value = Number(value)
        when 'String'
          if value then value = String(value)
        when 'Boolean'
          value = !!(value)
      return value
    
    setValues: (values = null) ->
      try
        for k, v of @_fields
          if v is null
            v = ''
          
          # Set default value if available
          if typeof v.default isnt 'undefined'
            def = v.default
          else
            def = null
          
          # Backwards compatibility with shorthands
          if typeof v.type isnt 'undefined'
            type = v.type
          else
            type = v
          
          key = type.toString().split(':')
          
          if typeof values[k] is 'undefined'
            if key[0] is 'Array'
              values[k] = []
            else
              values[k] = def
          
          if key[0] is 'Array'
            @[k] = []
            if key[1] is 'Object'
              className = key[2]
              
              for i in [0...values[k].length]
                value = values[k][i]
                obj = new @_namespace[className](value)
                @[k].push obj
            else
              @[k] = @typecast values[k], key[1]
          else if key[0] is 'Object'
            className = key[1]
            value = values[k]
            @[k] = new @_namespace[className](value)
          else
            @[k] = @typecast values[k], key[0]
      catch error
        console.error error.toString()
    
    getNavigation: ->
      return []
