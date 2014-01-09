window.Earmark = angular.module('Earmark', ['ngResource', 'ngRoute'])

Earmark.config(['$httpProvider', '$routeProvider', function($httpProvider, $routeProvider) {
  // CSRF Authentication for Rails requests
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

  $routeProvider
    .when('/new', {
      templateUrl: '../assets/new.html',
      controller: 'GoalCtrl'
    })
    .when('/', {
      templateUrl: '../assets/marks.html',
      controller: 'MarkCtrl'
    }).
    otherwise({
      redirectTo: '/'
    })
}])
