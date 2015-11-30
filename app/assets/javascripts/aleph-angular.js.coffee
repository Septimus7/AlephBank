app = angular.module('alephBank', ['ui.bootstrap'])

app.filter('startFrom', () ->
  (input, start) ->
    if (input)
      start = +start
      return input.slice(start)

    return []
)

app.controller('historyController', ['$scope', ($scope) ->
  $scope.filtered = $scope.historyItems = gon.history

  $scope.search = {}

  $scope.resetFilters = () ->
    $scope.search = {}

  $scope.currentPage = 1
  $scope.totalItems = $scope.historyItems.length
  $scope.entryLimit = 2
  $scope.noOfPages = Math.ceil($scope.totalItems / $scope.entryLimit)

  f = (newVal, oldVa) ->
    $scope.filtered = $scope.historyItems.filter($scope.matchTitle)
    $scope.filtered = $scope.filtered.filter($scope.matchAmount)
    $scope.totalItems = $scope.filtered.length
    $scope.noOfPages = Math.ceil($scope.totalItems / $scope.entryLimit)
    $scope.currentPage = 1


  $scope.matchAmount = (item) ->
    (not $scope.search.min_amount? or item.amount >= $scope.search.min_amount) and (not $scope.search.max_amount? or item.amount <= $scope.search.max_amount)

  $scope.matchTitle = (item) ->
    item.title.search($scope.search.transaction_title) != -1


  $scope.$watch('search', f, true)

])

app.controller('helpController', ['$scope', 'filterFilter', ($scope, filterFilter) ->
  $scope.gonData = gon

  $scope.currentHelpTab = gon.helpEntries[0]

  $scope.onClickHelpTab = (tab) ->
    $scope.currentHelpTab = tab

  $scope.isActiveHelpTab = (tab) ->
    tab == $scope.currentHelpTab

])

