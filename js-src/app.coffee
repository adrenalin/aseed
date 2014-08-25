define [
  'angular'
  'uiRouter'
  'filters'
  'services'
  'directives'
  'controllers'
  'angularResource'
  'angularSanitize',
], (angular) ->
    'use strict'
    
    module = angular.module('newApp', [
      'ngResource'
      'ngSanitize'
      'newApp.controllers'
      'newApp.filters'
      'newApp.services'
      'newApp.directives'
      'ui.router'
    ])
    return module
