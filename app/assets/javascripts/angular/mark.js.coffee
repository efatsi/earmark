Earmark.factory 'Mark', ['$resource', ($resource) ->
  $resource '/api/marks'
]

Earmark.service 'MarkService', ['Mark', (Mark) ->
  @all = ->
    Mark.query()

  @new = (scope) ->
    new Mark({
      description: scope.description,
      amount: scope.amount
      })

  @totalAmount = (marks) ->
    total = 0
    angular.forEach marks, (m) ->
      total += m.amount

    total
]
