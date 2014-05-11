define ['angular', 'services'], (angular) ->
  'use strict'

  module = angular.module 'newApp.controllers', ['newApp.services']
  
  module.controller 'Mainpage', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/mainpage'], (mainpage) ->
      $injector.invoke mainpage, this, {'$scope': $scope}
    ]
  
  module.controller 'Messages', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/messages'], (controller) ->
      $injector.invoke controller, this, {'$scope': $scope}
    ]

  module.controller 'Navigation', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/navigation'], (navigation) ->
      $injector.invoke navigation, this, {'$scope': $scope}
    ]
  
  return module
