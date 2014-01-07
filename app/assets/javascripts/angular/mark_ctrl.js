Earmark.controller('MarkCtrl', function($scope, Mark) {
  $scope.marks = Mark.all

  $scope.newMark = function() {
    markBuild = Mark.build($scope.mark)

    markBuild.$save(function(response) {
      if (response.success) {
        Mark.all = [markBuild.mark].concat(Mark.all)
        $scope.marks = Mark.all
        $scope.clearForm()
      }
      else {
        $scope.showError()
      }
    })
  }

  $scope.clearForm = function() {
    $scope.mark = {}
    $scope.toggleForm()
    $scope.hideError()
  }

  $scope.toggleForm = function() {
    $('.new-mark-form').slideToggle()
  }

  $scope.showError = function() {
    $('.error').slideDown()
  }

  $scope.hideError = function() {
    $('.error').slideUp()
  }

  $scope.saved = function() {
    return "Saved: $" + Mark.totalAmount($scope.marks)
  }

  $scope.togo = function(goal) {
    return "To Go: $" + (goal - Mark.totalAmount($scope.marks))
  }
})
