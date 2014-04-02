define ['jquery'], ($) ->
  return ['$scope', '$rootScope', '$stateParams', '$timeout', ($scope, $rootScope, $stateParams, $timeout) ->
    # Read to scope from global stack
    $scope.messageStack = self.messageStack
    
    prevOffset = -1
    
    # Display a message
    $scope.$on 'receiveMessage', (event, data) ->
      ts = (new Date()).getTime()
      msg = 
        id: ts
        message: data.message
        status: data.status
      
      self.messageStack[ts] = msg
        
      if data.status is 'notice'
        fn = ->
          $scope.removeMessage msg
        $timeout fn, 2000
      
      # Read from global variable
      $scope.messageStack = self.messageStack
    
    $scope.removeMessage = (msg) ->
      id = msg.id
      msg.status = 'prepare-hide'
      
      fn = ->
        delete self.messageStack[id]
        $scope.messageStack = self.messageStack
      
      $timeout fn, 1000
    
    #$rootScope.$broadcast 'receiveMessage', {status: 'error', message: 'Lorem ipsum'}
    $scope.$apply()
  ]
