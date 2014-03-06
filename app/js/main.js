// Generated by CoffeeScript 1.6.3
(function() {
  window.name = "NG_DEFER_BOOTSTRAP!";

  require.config({
    paths: {
      angular: '../../bower_components/angular/angular.min',
      angularResource: '../../bower_components/angular-resource/angular-resource.min',
      uiRouter: "../../bower_components/angular-ui-router/angular-ui-router.min",
      angularMocks: '../../bower_components/angular-mocks/angular-mocks.min',
      text: '../../bower_components/requirejs-text/text'
    },
    baseUrl: 'app/js',
    shim: {
      angular: {
        exports: 'angular'
      },
      angularResource: ['angular'],
      uiRouter: {
        deps: ['angular']
      },
      angularMocks: {
        deps: ['angular'],
        exports: 'angular.mock'
      }
    },
    priority: ["angular"]
  });

  require(['angular', 'app', 'routes'], function(angular, app, routes) {
    var $html;
    $html = angular.element(document.getElementsByTagName('html')[0]);
    return angular.element().ready(function() {
      $html.addClass('ng-app');
      return angular.bootstrap($html, [app['name']]);
    });
  });

}).call(this);
