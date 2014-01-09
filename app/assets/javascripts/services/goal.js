Earmark.factory('Goal', ['$resource', function($resource) {
  Goal = $resource('/api/goals')

  Goal.build = function(attrs) {
    return new Goal({
      description: attrs.description,
      amount: attrs.amount
    })
  }

  Goal.prototype.display = function() {
    return this.description + " - $" + this.amount
  }

  return Goal
}])
