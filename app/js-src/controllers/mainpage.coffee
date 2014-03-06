define [], () ->
  return ['$scope', '$rootScope', '$stateParams', ($scope, $rootScope, $stateParams) ->
    console.log 'mainpage controller with state parameters', $stateParams
    # # Prevent full page refresh with this
    # lastRoute = $route.current
    # $scope.$on '$locationChangeSuccess', (e) ->
    #   if window.location.hash.match(/#!\/view/) or window.location.hash is '#!/'
    #     $route.current = lastRoute
    
    $scope.$apply()
  ]
