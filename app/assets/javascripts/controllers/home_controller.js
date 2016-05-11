
angular.module('controllers', [])
  .controller('HomeController', ['$scope', '$state', '$stateParams', 'recipeService',
    function($scope, $state, $stateParams, recipeService) {
      recipeService.getAll().then(function() {
        $scope.recipes = recipeService.getData();
      });

      $scope.search = function(keywords) {
      };

      $scope.fiyin = 'Something special from home controller.';
}]);
