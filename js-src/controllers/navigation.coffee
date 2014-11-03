define [], () ->
  return ['$scope', '$rootScope', '$state', '$stateParams', '$timeout', ($scope, $rootScope, $state, $stateParams, $timeout) ->
    if typeof self.isLoggedIn is 'undefined'
      # @TODO: login status check
      self.isLoggedIn = true
    self.isLoggedIn = true
    
    $scope.navigation = [
      {
        url: $state.href("mainpage", $stateParams)
        state: 'mainpage'
        label: 'Etusivu'
        show: true
        selected: false
      }
      {
        url: $state.href("login", $stateParams)
        state: 'login'
        label: 'Kirjaudu sisään'
        show: !(self.isLoggedIn)
        selected: false
      }
      {
        url: $state.href("create", $stateParams)
        state: 'create'
        label: 'Luo tuote'
        show: self.isLoggedIn
        selected: false
      }
      {
        url: $state.href("logout", $stateParams)
        state: 'logout'
        label: 'Kirjaudu ulos'
        show: (self.isLoggedIn)
        selected: false
      }
    ]
    
    # Current url
    current = $state.href($state.current.name, $stateParams)
    title = ''
    description = ''
    
    for i in [0...$scope.navigation.length]
      if $scope.navigation[i].url is current
        title = $scope.navigation[i].label
    
    unless description then description = title
    
    # Default values
    $rootScope.page =
      fullUrl: "#{window.location.origin}/#{current}"
      title: title
      description: description
      siteName: "template"
    
    $scope.$on "setNavigation", (e, data) ->
      fn = ->
        stateParams = data.stateParams || $stateParams
        
        # Populate root scope, i.e. metadata for Google and OpenGraph
        for k, v of $rootScope.page
          if typeof data[k] isnt 'undefined'
            $rootScope.page[k] = data[k]
        
        if typeof data.state isnt 'undefined'
          $rootScope.fullUrl = "#{window.location.origin}/#{$state.href(data.state, stateParams)}"
          
          for i in [0...$scope.navigation.length]
            if $scope.navigation[i].state is data.state
              $scope.navigation[i].selected = true
            else
              $scope.navigation[i].selected = false
        else if typeof data.url isnt 'undefined'
          $rootScope.fullUrl = "#{window.location.origin}/#{data.url}"
          
          for i in [0...$scope.navigation.length]
            if $scope.navigation[i].url is data.url
              $scope.navigation[i].selected = true
            else
              $scope.navigation[i].selected = false
      
      # Hop on the next cycle to wait for $stateParams to be populated
      $timeout fn, 50
    
    $scope.isActive = ->
      if window.location.hash is @item.url then return true else return false
    
    $scope.$apply()
  ]
