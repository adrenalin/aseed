define ['angular', 'services'], (angular, services) ->
  'use strict'

  module = angular.module 'products.directives', ['products.services']
  module.directive 'appVersion', ['version', (version) ->
    return (scope, elm, attrs) ->
      elm.text(version)
  ]
