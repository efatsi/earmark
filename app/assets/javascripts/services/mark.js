Earmark.factory('Mark', ['$resource', function($resource) {
  Mark = $resource('/api/marks')

  Mark.all = Mark.query()

  Mark.build = function(attrs) {
    return new Mark({
      description: attrs.description,
      amount: attrs.amount
      })
  }

  Mark.totalAmount = function() {
    total = 0
    angular.forEach(Mark.all, function(m) {
      total += m.amount
    })

    return total
  }

  return Mark
}])
