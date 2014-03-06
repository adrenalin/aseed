define ['angular', 'services'], (angular, services) ->
  'use strict'
  module = angular.module 'products.filters', ['products.services']
  module.filter 'interpolate', ['version', (version) ->
    (text) ->
      String(text).replace(/\%VERSION\%/mg, version)
  ]
