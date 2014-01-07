window.Earmark = angular.module('Earmark', ['ngResource'])

Earmark.config(['$httpProvider', function($httpProvider) {
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
}])
