Earmark.factory('Mark', ['$resource', '$http', function($resource, $http) {
  Mark = $resource('/api/marks')

  Mark.all = Mark.query()

  Mark.unsaved = Mark.query({query: 'unsaved'})

  Mark.build = function(attrs) {
    return new Mark({
      description: attrs.description,
      amount: attrs.amount
      })
  }

  Mark.totalAmount = function(marks) {
    total = 0
    angular.forEach(marks, function(m) {
      total += m.amount
    })

    return total
  }

  Mark.transferAll = function() {
    return $http({method: "PUT", url: "/api/transfer_marks"})
  }

  return Mark
}])
