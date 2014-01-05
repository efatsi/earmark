Earmark.controller 'MarkCtrl', ['$scope', 'MarkService', ($scope, MarkService) ->
  $scope.marks = MarkService.all()

  $scope.newMark = ->
    mark = MarkService.new($scope)

    mark.$save (response) ->
      if (response.success)
        $scope.marks = MarkService.all()
        $scope.clearForm()
      else
        $scope.showError()

  $scope.clearForm = ->
    $scope.description = ''
    $scope.amount = ''
    $scope.toggleForm()
    $scope.hideError()

  $scope.toggleForm = ->
    $('.new-mark-form').slideToggle()

  $scope.showError = ->
    $('.error').slideDown()

  $scope.hideError = ->
    $('.error').slideUp()

  $scope.saved = ->
    "Saved: $#{MarkService.totalAmount($scope.marks)}"

  $scope.togo = (goal) ->
    "To Go: $#{goal - MarkService.totalAmount($scope.marks)}"
]
