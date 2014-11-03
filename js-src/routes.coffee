define ['angular', 'app'], (angular, app) ->
  'use strict'

  return app.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $locationProvider.hashPrefix('!')
    
    defaultControllers =
      navigation:
        controller: 'Navigation'
        templateUrl: 'partials/navigation.html'
      messages:
        controller: 'Messages'
        templateUrl: 'partials/messages.html'
    
    $stateProvider.state 'mainpage',
      url: '/'
      views: angular.extend {}, defaultControllers,
        content:
          controller: 'Mainpage'
          templateUrl: 'partials/mainpage.html'
    
    $stateProvider.state 'subpage',
      url: '/:pageId'
      views: angular.extend {}, defaultControllers,
        content:
          controller: 'Mainpage'
          templateUrl: 'partials/mainpage.html'
    
    $urlRouterProvider.otherwise('/')
