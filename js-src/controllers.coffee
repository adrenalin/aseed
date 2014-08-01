define ['angular', 'services'], (angular, services) ->
  'use strict'

  module = angular.module 'newApp.controllers', ['newApp.services']
  
  # Common rules for initializing a scope
  initScope = ($scope) ->
    return $scope
  
  module.controller 'Mainpage', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/mainpage'], (controller) ->
      $injector.invoke controller, this, {'$scope': initScope($scope)}
    ]
  
  module.controller 'Messages', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/messages'], (controller) ->
      $injector.invoke controller, this, {'$scope': initScope($scope)}
    ]

  module.controller 'Navigation', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/navigation'], (controller) ->
      $injector.invoke controller, this, {'$scope': initScope($scope)}
    ]
  
  return module
