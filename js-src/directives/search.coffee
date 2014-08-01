define ['text!../locales/search.xml'], (localesXML) ->
  directive = ($http, $timeout, l10n) ->
    timer = null
    prev = ''
    
    # Add locales
    l10n.addLocalesXML(localesXML)
    
    dir =
      templateUrl: 'app/partials/directives/search.html'
      restrict: 'EA'
      require: '^ngModel'
      scope:
        ngModel: '='
        multiple: '@'
        limit: '@'
        api: '@'
        allowCreate: '@'
        bindId: '='
        bindLabel: '='
        modelObject: '='
      
      link: ($scope, el, attrs) ->
        $scope.showInput = true
        $scope.apiSearchResults = []
        
        # GUI helper for browsing with keyboard
        $scope.selectedOption = null
        $scope.isOptionSelected = ->
          if @v is $scope.selectedOption then return true else return false
        
        # Expose l10n
        $scope._ = l10n.get
          
        # Get model class if available
        modelConstructor = null
        
        if typeof $scope.modelObject isnt 'undefined' and $scope.modelObject
          modelConstructor = $scope.modelObject
        else if $scope.ngModel
          modelConstructor = $scope.ngModel.__proto__.constructor
        
        # Check if the requested id is in results array
        inArray = (val, arr) ->
          for i in [0...arr.length]
            if arr[i].id is val then return true
            if arr[i].label is val then return true
          
          return false
        
        if typeof $scope.multiple isnt 'undefined' and $scope.multiple is 'true'
          $scope.allowMultiple = true
        else
          $scope.allowMultiple = false
        
        if angular.isArray $scope.ngModel
          $scope.model = $scope.ngModel
        else if $scope.ngModel
          $scope.model = [$scope.ngModel]
        else
          $scope.model = []
        
        fn = ->
          if typeof $scope.ngModel is 'undefined'
            $timeout fn, 100
          else
            dir.link($scope, el, attrs)
        
        if typeof $scope.ngModel is 'undefined'
          $timeout fn, 100
        
        # Create new if search does not find
        if typeof $scope.allowCreate isnt 'undefined' and $scope.allowCreate is 'true'
          $scope.createNew = true
        else
          $scope.createNew = false
        
        if typeof $scope.limit is 'undefined'
          if $scope.allowMultiple is true
            limit = -1
          else
            limit = 1
        else
          limit = Number($scope.limit)
        
        # Check if the maximum selectable options is filled
        $scope.canHaveMore = ->
          if typeof $scope.model is 'undefined'
            return false
          
          if limit < 0 then return true
          
          if limit > $scope.model.length
            return true
          return false
        
        # Remove an option
        $scope.removeOption = (id) ->
          for i in [0...$scope.model.length]
            if $scope.model[i].id is id
              $scope.model.splice(i, 1)
              break
          
          $scope.ngModel = $scope.model
        
        # Set value
        $scope.setValue = (v) ->
          if v.id and inArray(v.id, $scope.model)
            $scope.apiSearchQuery = ''
            $scope.apiSearchResults = []
            return
          if v.label and inArray(v.label, $scope.model)
            $scope.apiSearchQuery = ''
            $scope.apiSearchResults = []
            return
          
          if modelConstructor
            v = new modelConstructor(v)
          
          if $scope.allowMultiple
            if v.label or v.id
              $scope.model.push v
            
            # Bind id if requested
            if typeof $scope.bindId isnt 'undefined'
              $scope.bindId = []
              for i in [0...$scope.model.length]
                $scope.bindId.push $scope.model[i].id
            
            # Bind label if requested
            if typeof $scope.bindLabel isnt 'undefined'
              $scope.bindLabel = []
              for i in [0...$scope.model.length]
                $scope.bindLabel.push $scope.model[i].label
            $scope.ngModel = $scope.model
          else
            $scope.model = [v]
            $scope.ngModel = v
            
            # Bind id if requested
            if typeof $scope.bindId isnt 'undefined'
              $scope.bindId = v.id
            
            # Bind label if requested
            if typeof $scope.bindLabel isnt 'undefined'
              $scope.bindLabel = v.label
          
          $scope.apiSearchQuery = ''
          $scope.apiSearchResults = []
          $scope.selectedOption = null
        
        $input = el.find('input')
        
        $input.bind 'blur', (e) ->
          fn = ->
            $scope.apiSearchResults = []
            $scope.selectedOption = null
          $timeout fn, 200
        
        $input.bind 'keydown', (e) ->
          switch e.keyCode
            when 38
              fn = ->
                if !$scope.selectedOption
                  i = $scope.apiSearchResults.length - 1
                  return if typeof $scope.apiSearchResults[i] is 'undefined'
                  $scope.selectedOption = $scope.apiSearchResults[i]
                  return
                
                for i in [0...$scope.apiSearchResults.length]
                  if $scope.apiSearchResults[i] is $scope.selectedOption
                    $scope.selectedOption = prev
                    break
                  prev = $scope.apiSearchResults[i]
              $timeout fn, 100
              e.cancelBubble = true
              e.preventDefault()
              return false
            
            when 40
              fn = ->
                current = null
                if !$scope.selectedOption
                  return if typeof $scope.apiSearchResults[0] is 'undefined'
                  $scope.selectedOption = $scope.apiSearchResults[0]
                  return
                
                for i in [0...$scope.apiSearchResults.length]
                  if $scope.apiSearchResults[i] is $scope.selectedOption
                    current = $scope.apiSearchResults[i]
                    continue
                  
                  if current
                    $scope.selectedOption = $scope.apiSearchResults[i]
                    break
              $timeout fn, 100
              e.cancelBubble = true
              e.preventDefault()
              return false
            
            when 27
              fn = ->
                $scope.apiSearchQuery = ''
                $scope.apiSearchResults = []
              $timeout fn, 100
              e.cancelBubble = true
              e.preventDefault()
              return false
            
            when 13
              fn = ->
                if $scope.selectedOption
                  $scope.setValue($scope.selectedOption)
                  return
                
                if $scope.createNew
                  return false unless $input.val()
                  opt =
                    id: null
                    label: $input.val()
                  $scope.setValue(opt)
                
              $timeout fn, 100
              e.cancelBubble = true
              e.preventDefault()
              return false
          
          # Cancel previous timer when needed
          if timer then $timeout.cancel(timer)
          
          # Create a new timed API request
          fn = ->
            url = $scope.api
            
            unless url.match(/\/$/) then url += '/'
            
            url += $scope.apiSearchQuery
            
            xhr = $http.get url
            xhr.success (data, status) ->
              $scope.apiSearchResults = []
              fullMatch = false
              
              for i in [0...data.length]
                continue if inArray(data[i].id, $scope.model)
                continue if inArray(data[i].label, $scope.model)
                $scope.apiSearchResults.push data[i]
                
                if data[i].label.toLowerCase() is $scope.apiSearchQuery.toLowerCase() then fullMatch = true
              
              # Check if GUI should suggest to create a new according to the entered string
              if !fullMatch and $scope.apiSearchQuery and $scope.allowCreate
                createObject =
                  id: null
                  label: $scope.apiSearchQuery
                  
                $scope.apiSearchResults.push createObject
          
          timer = $timeout fn, 500
