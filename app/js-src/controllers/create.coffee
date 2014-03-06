define [], () ->
  return ['$scope', '$rootScope', '$stateParams', ($scope, $rootScope, $stateParams) ->
    console.log 'create controller with state parameters', $stateParams
    # # Prevent full page refresh with this
    # lastRoute = $route.current
    # $scope.$on '$locationChangeSuccess', (e) ->
    #   if window.location.hash.match(/#!\/view/) or window.location.hash is '#!/'
    #     $route.current = lastRoute
      
    # because this has happened asynchroneusly we've missed
    # Angular's initial call to $apply after the controller has been loaded
    # hence we need to explicityly call it at the end of our Controller constructor
    $scope.$apply()
  ]
