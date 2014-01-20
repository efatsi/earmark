Earmark.controller('TransferCtrl', ['$scope', 'Mark', function($scope, Mark) {
  $scope.marks = Mark.all

  $scope.anyMarks = function() {
    return $scope.marks.length > 0
  }

  $scope.unsaved = function() {
    return Mark.totalAmount(Mark.unsaved)
  }

  $scope.transfer = function() {
    Mark.transferAll().then(function(response) {
      Mark.unsaved = []
      Mark.all = response.data

      $scope.marks = Mark.all
    })
  }
}])
