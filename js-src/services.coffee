define ['services/l10n'], (l10n) ->
  'use strict'
  module = angular.module('newApp.services', [])
  module.value('version', '0.1')
  
  module.factory 'l10n', ->
    return l10n
  
  return module