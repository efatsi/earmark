Earmark.controller('GoalCtrl', ['$scope', '$location', 'Goal', function($scope, $location, Goal) {
  $scope.goal = {}

  $scope.newGoal = function() {
    goal = Goal.build($scope.goal)

    goal.$save(function(response) {
      if (response.success) {
        $location.path("/")
      }
      else {
        showError()
      }
    })
  }

  $scope.cancel = function() {
    redirectHome()
  }

  redirectHome = function() {
    $location.path("/")
  }

  showError = function() {
    $('.error').slideDown()
  }
}])
