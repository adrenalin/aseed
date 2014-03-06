define ['angular', 'services'], (angular) ->
  'use strict'

  module = angular.module 'newApp.controllers', ['newApp.services']
  
  module.controller 'Mainpage', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/mainpage'], (mainpage) ->
      $injector.invoke mainpage, this, {'$scope': $scope}
    ]
  
  module.controller 'Create', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/create'], (create) ->
      $injector.invoke create, this, {'$scope': $scope}
    ]
  
  module.controller 'Navigation', ['$scope', '$injector', ($scope, $injector) ->
    require ['controllers/navigation'], (navigation) ->
      $injector.invoke navigation, this, {'$scope': $scope}
    ]
  
  return module
