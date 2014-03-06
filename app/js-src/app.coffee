define [
  'angular'
  'uiRouter'
  'filters'
  'services'
  'directives'
  'controllers'
  'angularResource'
], (angular) ->
    'use strict'
    
    module = angular.module('products', [
      'ngResource'
      'products.controllers'
      'products.filters'
      'products.services'
      'products.directives'
      'ui.router'
    ])
    return module
