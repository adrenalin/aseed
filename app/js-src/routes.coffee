define ['angular', 'app'], (angular, app) ->
  'use strict'

  return app.config ($stateProvider, $urlRouterProvider) ->
    navigationView =
      controller: 'Navigation'
      templateUrl: 'app/partials/navigation.html'
    
    $stateProvider.state 'mainpage',
      url: '/'
      views:
        content:
          controller: 'Mainpage'
          templateUrl: 'app/partials/mainpage.html'
        navigation: navigationView
    
    $stateProvider.state 'create',
      url: '/create'
      views:
        content:
          templateUrl: 'app/partials/create.html'
          controller: 'Create'
        navigation: navigationView
    
    $urlRouterProvider.otherwise('/')
