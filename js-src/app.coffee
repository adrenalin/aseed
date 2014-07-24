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
  
  module = angular.module('newApp', [
    'ngResource'
    'newApp.controllers'
    'newApp.filters'
    'newApp.services'
    'newApp.directives'
    'ui.router'
  ])
  return module
