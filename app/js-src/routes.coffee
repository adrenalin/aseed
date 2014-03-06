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
    
    $stateProvider.state 'subpage',
      url: '/:pageId'
      views:
        content:
          controller: 'Mainpage'
          templateUrl: 'app/partials/mainpage.html'
        navigation: navigationView
    
    $urlRouterProvider.otherwise('/')
