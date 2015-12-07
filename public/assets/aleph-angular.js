(function() {
  var app;

  app = angular.module('alephBank', ['ui.bootstrap']);

  app.filter('startFrom', function() {
    return function(input, start) {
      if (input) {
        start = +start;
        return input.slice(start);
      }
      return [];
    };
  });

  app.controller('transactionController', [
    '$scope', function($scope) {
      var account, i, len, ref;
      $scope.accounts = gon.accounts;
      $scope.source_account = $scope.accounts[0].id;
      $scope.accounts_h = {};
      ref = $scope.accounts;
      for (i = 0, len = ref.length; i < len; i++) {
        account = ref[i];
        $scope.accounts_h[account.id] = account;
      }
      return $scope.hasNotMoney = function() {
        var v;
        if ($scope.transaction.amount.$viewValue == null) {
          return;
        }
        v = $scope.transaction.amount.$viewValue < $scope.accounts_h[$scope.source_account].amount;
        return $scope.transaction.amount.$setValidity('not_enough_money', v);
      };
    }
  ]);

  app.controller('historyController', [
    '$scope', function($scope) {
      var f;
      $scope.filtered = $scope.historyItems = gon.history;
      $scope.accounts = gon.accounts;
      $scope.search = {};
      $scope.resetFilters = function() {
        return $scope.search = {};
      };
      $scope.currentPage = 1;
      $scope.totalItems = $scope.historyItems.length;
      $scope.entryLimit = 10;
      $scope.noOfPages = Math.ceil($scope.totalItems / $scope.entryLimit);
      f = function(newVal, oldVa) {
        $scope.filtered = $scope.historyItems.filter($scope.matchTitle);
        $scope.filtered = $scope.filtered.filter($scope.matchAmount);
        $scope.totalItems = $scope.filtered.length;
        $scope.noOfPages = Math.ceil($scope.totalItems / $scope.entryLimit);
        return $scope.currentPage = 1;
      };
      $scope.matchAmount = function(item) {
        return (($scope.search.min_amount == null) || item.amount >= $scope.search.min_amount) && (($scope.search.max_amount == null) || item.amount <= $scope.search.max_amount);
      };
      $scope.matchTitle = function(item) {
        return item.title.search($scope.search.transaction_title) !== -1;
      };
      return $scope.$watch('search', f, true);
    }
  ]);

  app.controller('helpController', [
    '$scope', 'filterFilter', function($scope, filterFilter) {
      $scope.gonData = gon;
      $scope.currentHelpTab = gon.helpEntries[0];
      $scope.onClickHelpTab = function(tab) {
        return $scope.currentHelpTab = tab;
      };
      return $scope.isActiveHelpTab = function(tab) {
        return tab === $scope.currentHelpTab;
      };
    }
  ]);

}).call(this);