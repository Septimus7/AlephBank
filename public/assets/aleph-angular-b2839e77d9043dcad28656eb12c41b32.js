(function() {
  var app;

  app = angular.module('alephBank', []);

  app.controller('alephController', function($scope) {
    return $scope.gonData = gon;
  });

}).call(this);
