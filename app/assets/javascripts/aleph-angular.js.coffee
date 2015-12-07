app = angular.module('alephBank', ['ui.bootstrap'])

app.filter('startFrom', () ->
  (input, start) ->
    if (input)
      start = +start
      return input.slice(start)

    return []
)

app.filter('to_trusted', ['$sce', ($sce)->
  (text) -> $sce.trustAsHtml(text)
])

app.controller('transactionController', ['$scope', ($scope) ->
  $scope.accounts = gon.accounts
  $scope.source_account = $scope.accounts[0].id

  $scope.accounts_h = {}

  for account in $scope.accounts
    $scope.accounts_h[account.id] = account

  $scope.hasNotMoney = () ->
    if not $scope.transaction.amount.$viewValue?
      return
    v = $scope.transaction.amount.$viewValue < $scope.accounts_h[$scope.source_account].amount

    $scope.transaction.amount.$setValidity('not_enough_money', v);

])

app.controller('historyController', ['$scope', ($scope) ->
  $scope.filtered = $scope.historyItems = gon.history
  $scope.accounts = gon.accounts

  $scope.search = {}

  $scope.resetFilters = () ->
    $scope.search = {}

  $scope.currentPage = 1
  $scope.totalItems = $scope.historyItems.length
  $scope.entryLimit = 10
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

