define [], () ->
  return ['$scope', '$rootScope', '$stateParams', ($scope, $rootScope, $stateParams) ->
    console.log 'navigation controller with state parameters', $stateParams
    
    if typeof self.isLoggedIn is 'undefined'
      # @TODO: login status check
      self.isLoggedIn = true
    self.isLoggedIn = true
    
    $scope.navigation = [
      {
        url: '#/'
        label: 'Etusivu'
        show: true
      }
      {
        url: '#/login'
        label: 'Kirjaudu sisään'
        show: !(self.isLoggedIn)
      }
      {
        url: '#/create'
        label: 'Luo tuote'
        show: self.isLoggedIn
      }
      {
        url: '#/logout'
        label: 'Kirjaudu ulos'
        show: (self.isLoggedIn)
      }
    ]
    
    $scope.isActive = ->
      if window.location.hash is @item.url then return true else return false
    
    $scope.$apply()
  ]
