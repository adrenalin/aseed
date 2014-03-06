define [], ->
  directive = ($http, $timeout) ->
    dir =
      templateUrl: 'app/partials/directives/template.html'
      restrict: 'EA'
      require: '^ngModel'
      scope:
        ngModel: '='
      link: ($scope, el, attrs) ->
        console.log 'template directive triggered'
