var ceeaches, controllers, recipes;

ceeaches = angular.module('ceeaches', [
  'templates',
  'ngRoute',
  'controllers'
]);

ceeaches.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'index.html',
      controller: 'RecipesController'
    })
}]);

recipes = [
  {
    id: 1,
    name: 'Baked Potato w/ Cheese'
  }, {
    id: 2,
    name: 'Garlic Mashed Potatoes'
  }, {
    id: 3,
    name: 'Potatoes Au Gratin'
  }, {
    id: 4,
    name: 'Baked Brussel Sprouts'
  }
];

controllers = angular.module('controllers', []);

controllers.controller('RecipesController', ['$scope', '$location', '$routeParams', function($scope, $location, $routeParams) {
  var keywords;

  $scope.search = function(keywords) {
    return $location.path("/").search('keywords', keywords);
  };

  if ($routeParams.keywords) {
    keywords = $routeParams.keywords.toLowerCase();
    return $scope.recipes = recipes.filter(function(recipe) {
      return recipe.name.toLowerCase().indexOf(keywords) !== -1;
    });
  } else {
    return $scope.recipes = [];
  }
}]);
