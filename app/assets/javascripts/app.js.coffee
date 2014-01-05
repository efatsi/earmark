window.Earmark = angular.module('Earmark', ['ngResource'])

Earmark.config ['$httpProvider', ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
]

Earmark.factory 'Mark', ['$resource', ($resource) ->
  $resource '/api/marks'
]

Earmark.controller 'MarkCtrl', ['$scope', 'Mark', ($scope, Mark) ->
  $scope.marks = Mark.query()

  $scope.submit = ->
    mark = new Mark({
      description: $scope.description,
      amount: $scope.amount
      })

    mark.$save(mark,
      (response) ->
        if (response.success)
          $scope.marks = Mark.query()
          $scope.clearForm()
        else
          $scope.toggleErrror()
      )

  $scope.clearForm = ->
    $scope.description = ''
    $scope.amount = ''
    $scope.toggleForm()

  $scope.toggleForm = ->
    $('.new-mark-form').slideToggle();

  $scope.toggleErrror = ->
    $('.error').slideToggle();

  $scope.saved = ->
    "Saved: $#{$scope.savedAmount()}"

  $scope.savedAmount = ->
    amount = (m) ->
      m.amount

    $scope.marks.map(amount).reduce (a,b) ->
      a + b

  $scope.togo = (goal) ->
    "To Go: $#{goal - $scope.savedAmount()}"
]
