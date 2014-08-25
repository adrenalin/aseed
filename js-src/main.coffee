# hey Angular, we're bootstrapping manually!
window.name = "NG_DEFER_BOOTSTRAP!"

require.config
  paths:
    angular: 'lib/angular/angular.min'
    angularResource: 'lib/angular-resource/angular-resource.min'
    angularSanitize: 'lib/angular-sanitize/angular-sanitize.min'
    uiRouter: "lib/angular-ui-router/release/angular-ui-router.min"
    uiRouterStateHelper: 'lib/angular-ui-router.stateHelper/statehelper.min'
    angularMocks: 'lib/angular-mocks/angular-mocks.min'
    text: 'lib/requirejs-text/text'
    jquery: 'lib/jquery/dist/jquery.min'
    jqueryTimers: 'lib/jquery-timers/jquery.timers.min'
    model: 'lib/aseed-model/model'
#     l10n: 'lib/aseed-service-l10n/l10n'
#     queryparams: 'lib/aseed-service-queryparams'
  
  baseUrl: 'js'
  #urlArgs: 'ts=' + (new Date()).getTime()
  shim:
    angular:
      exports: 'angular'
    angularResource: [
      'angular'
    ]
    angularSanitize: [
      deps: ['angular']
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
