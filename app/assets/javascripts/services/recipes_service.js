angular.module('services', [])
  .service('recipeService', ['$http', function ($http) {
    var recipeData = {};

    return {
      getAll: function () {
        return $http.get('/api/v1/recipes/').success(function (data) {
          recipeData = data;
        })
      },
      getData: function () {
        return recipeData;
      },
      getRecipe: function (id) {
        return $http.get('/api/v1/recipes/' + id);
      }
    };
  }]);