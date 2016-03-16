
angular.module('ceeaches')
  .controller('RecipesController', ['$scope', '$location', '$routeParams', '$resource',
    function($scope, $location, $routeParams, $resource) {
      var keywords,
          Recipe;

      $scope.search = function(keywords) {
        return $location.path("/").search('keywords', keywords);
      };

      Recipe = $resource('/api/recipes/:recipeId', { recipeId: "@id", format: 'json' });

      if ($routeParams.keywords) {
        Recipe.query({keywords: $routeParams.keywords}, function (results) {
          $scope.recipes = results;
        });
      } else {
        return $scope.recipes = [];
      }
}]);
