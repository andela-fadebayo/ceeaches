var ceeaches, controllers, recipes;

ceeaches = angular.module('ceeaches', [
  'templates',
  'ngRoute',
  'ngResource',
  'controllers'
]);

ceeaches.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'index.html',
      controller: 'RecipesController'
    })
}]);

controllers = angular.module('controllers', []);

controllers.controller('RecipesController', ['$scope', '$location', '$routeParams', '$resource', function($scope, $location, $routeParams, $resource) {
  var keywords, Recipe;

  $scope.search = function(keywords) {
    return $location.path("/").search('keywords', keywords);
  };

  Recipe = $resource('/api/recipes/:recipeId', { recipeId: "@id", format: 'json' });

  if ($routeParams.keywords) {
    //keywords = $routeParams.keywords.toLowerCase();
    //return $scope.recipes = recipes.filter(function(recipe) {
    //  return recipe.name.toLowerCase().indexOf(keywords) !== -1;
    //});

    Recipe.query({keywords: $routeParams.keywords}, function (results) {
      $scope.recipes = results;
    });
  } else {
    return $scope.recipes = [];
  }
}]);
