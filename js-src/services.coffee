#define ['angular', 'l10n', 'text!../locales/core.xml'], (angular, L10n, locales) ->
define ['angular'], (angular) ->
  'use strict'
  module = angular.module('newApp.services', [])
  module.value('version', '0.1')
  
#   module.factory 'l10n', ->
#     l10n = new L10n()
#     l10n.addXML(locales)
#     return l10n
  
  return module