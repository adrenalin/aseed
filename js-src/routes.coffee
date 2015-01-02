define ['angular', 'app'], (angular, app) ->
  'use strict'

  return app.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $locationProvider.hashPrefix('!')
    
    defaultControllers =
      navigation:
        controller: 'navigation'
        templateUrl: 'partials/navigation.html'
      messages:
        controller: 'messages'
        templateUrl: 'partials/messages.html'
    
    $stateProvider.state 'page',
      url: '/'
      abstract: true
      views: angular.extend {}, defaultControllers,
        content:
          controller: 'page'
          templateUrl: 'partials/page.html'
    
    $stateProvider.state 'page.mainpage',
      url: ''
      views: angular.extend {}, defaultControllers,
        content:
          controller: 'page'
          templateUrl: 'partials/page.html'
    
    $stateProvider.state 'page.subpage',
      url: '/:pageId'
      views: angular.extend {}, defaultControllers,
        content:
          controller: 'page'
          templateUrl: 'partials/page.html'
    
    $urlRouterProvider.otherwise('/')
