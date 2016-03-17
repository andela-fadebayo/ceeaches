
angular.module('ceeaches')
  .controller('RecipesController', ['$scope', '$state', '$stateParams', 'recipeService',
    function($scope, $state, $stateParams, recipeService) {
      recipeService.getAll().then(function() {
        $scope.recipes = recipeService.getData();
      });

      $scope.search = function(keywords) {
      };
}]);
