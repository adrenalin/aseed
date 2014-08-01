define ['jquery'], ($) ->
  return ['$scope', '$rootScope', '$stateParams', '$timeout', ($scope, $rootScope, $stateParams, $timeout) ->
    # No full refresh on location change. Message center should be persistent
    $rootScope.$on '$locationChangeSuccess', (e) ->
      e.preventDefault()
    
    pageTitle = 'Template'
    $rootScope.pageTitle = pageTitle
    
    prevOffset = -1
    
    $scope.messageStack = {}
      
    # Clear a message with the given ID
    $scope.$on 'removeMessage', (events, ids) ->
      if !angular.isArray(ids)
        ids = [ids]
      
      for i in [0...ids.length]
        for k, v of $scope.messageStack
          if v.id is ids[i]
            $scope.removeMessage(v)
    
    # Remove all messages
    $scope.$on 'removeMessages', ->
      for k, v of $scope.messageStack
        $scope.removeMessage(v)
    
    # Display a message
    $scope.$on 'receiveMessage', (event, data) ->
      if typeof data.id is 'undefined'
        data.id = (new Date()).getTime()
      
      msg = 
        id: data.id
        message: data.message
        status: data.status
      
      $scope.messageStack[data.id] = msg
        
      if data.status is 'notice'
        fn = ->
          $scope.removeMessage msg
        $timeout fn, 2000
    
    $scope.removeMessage = (msg) ->
      msg.status = 'prepare-hide'
      
      fn = ->
        delete $scope.messageStack[msg.id]
      
      $timeout fn, 1000
    
    # Set page title
    $scope.$on 'setTitle', (event, title) ->
      title.push pageTitle
      
      $rootScope.pageTitle = title.join(' | ')
    
    $scope.$apply()
  ]
