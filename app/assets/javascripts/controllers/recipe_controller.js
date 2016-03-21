angular.module('controllers')
  .controller('RecipeController', ['$scope', '$stateParams', 'recipeService', function ($scope, $stateParams, recipeService) {
    $scope.recipeId = $stateParams.id;

    recipeService.getRecipe($scope.recipeId).success(function (data) {
      $scope.recipe = data;
    });
  }]);
