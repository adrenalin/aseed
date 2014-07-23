define ['angular', 'services'], (angular) ->
  'use strict'

  module = angular.module 'newApp.controllers', ['newApp.services']
  
  module.controller 'Mainpage', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/mainpage'], (controller) ->
      $injector.invoke controller, this, {'$scope': $scope}
    ]
  
  module.controller 'Messages', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/messages'], (controller) ->
      $injector.invoke controller, this, {'$scope': $scope}
    ]

  module.controller 'Navigation', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/navigation'], (controller) ->
      $injector.invoke controller, this, {'$scope': $scope}
    ]
  
  return module
