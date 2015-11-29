app = angular.module('alephBank', [])

app.controller('alephController', ($scope) ->
  $scope.gonData = gon

  $scope.currentHelpTab = gon.helpEntries[0]

  $scope.onClickHelpTab = (tab) ->
    $scope.currentHelpTab = tab

  $scope.isActiveHelpTab = (tab) ->
    tab == $scope.currentHelpTab

)