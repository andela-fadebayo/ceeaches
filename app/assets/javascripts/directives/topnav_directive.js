angular.module('ceeaches')
  .directive('topNav', [function () {
    return {
      restrict: 'E',
      replace: true,
      templateUrl: 'directives/top-nav.html'
    }
  }]);
