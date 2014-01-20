Earmark.factory('Goal', ['$resource', function($resource) {
  Goal = $resource('/api/goals')

  Goal.prototype.display = function() {
    return this.description + " - $" + this.amount
  }

  return Goal
}])
