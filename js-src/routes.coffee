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
    
    $stateProvider.state 'pages',
      url: '/'
      abstract: true
      views: angular.extend {}, defaultControllers,
        content:
          controller: 'page'
          templateUrl: 'partials/mainpage.html'
    
    $stateProvider.state 'pages.mainpage',
      url: ''
    
    $stateProvider.state 'pages.subpage',
      url: '/:pageId'
      views: angular.extend {}, defaultControllers,
        content:
          controller: 'page'
          templateUrl: 'partials/page.html'
    
    $urlRouterProvider.otherwise('/')
