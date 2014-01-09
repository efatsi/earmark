Earmark.controller('MarkCtrl', ['$scope', 'Mark', 'Goal', function($scope, Mark, Goal) {
  $scope.goal = Goal.get()

  $scope.marks = Mark.all
  $scope.mark = {}

  $scope.newMark = function() {
    mark = Mark.build($scope.mark)

    mark.$save(function(response) {
      if (response.success) {
        Mark.all = [mark.mark].concat(Mark.all)
        $scope.marks = Mark.all
        $scope.clearForm()
      }
      else {
        $scope.showError()
      }
    },

    function(error) {
      $scope.showError()
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
    return Mark.totalAmount($scope.marks)
  }

  $scope.togo = function() {
    return $scope.goal.amount - $scope.saved()
  }
}])
