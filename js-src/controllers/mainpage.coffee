define [], () ->
  return ['$scope', '$rootScope', '$stateParams', ($scope, $rootScope, $stateParams) ->
    console.log 'mainpage controller with state parameters', $stateParams
    
    # Pass to messaging
    #$rootScope.$broadcast 'receiveMessage', {status: 'error', message: data.message}
    
    # Pass to navigation
    #$rootScope.$broadcast 'setNavigation', $scope.product.getNavigation()
    
    $scope.$apply()
  ]
