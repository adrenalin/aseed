define ['angular', 'services', 'directives/template'], (angular, services, template) ->
  'use strict'

  module = angular.module 'newApp.directives', ['newApp.services']
  
  # Define template directive, which uses namespaces <apiTemplate /> and <object api-template />
  module.directive 'apiTemplate', template
  
  return module
