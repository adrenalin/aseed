# hey Angular, we're bootstrapping manually!
window.name = "NG_DEFER_BOOTSTRAP!"

require.config
  paths:
    angular: '../../bower_components/angular/angular.min'
    angularResource: '../../bower_components/angular-resource/angular-resource.min'
    uiRouter: "../../bower_components/angular-ui-router/angular-ui-router.min"
    angularMocks: '../../bower_components/angular-mocks/angular-mocks.min'
    text: '../../bower_components/requirejs-text/text'
  
  baseUrl: 'app/js'
  #urlArgs: 'ts=' + (new Date()).getTime()
  shim:
    angular:
      exports: 'angular'
    angularResource: [
      'angular'
    ]
    uiRouter:
      deps: [
        'angular'
      ]
    angularMocks:
      deps: [
        'angular'
      ]
      exports: 'angular.mock'
  priority: [
    "angular"
  ]


require ['angular', 'app', 'routes'], (angular, app, routes) ->
  $html = angular.element(document.getElementsByTagName('html')[0]);
  
  angular.element().ready ->
    $html.addClass('ng-app')
    angular.bootstrap($html, [app['name']])
