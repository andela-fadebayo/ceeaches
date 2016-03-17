angular.module('services', [])
  .service('recipeService', ['$http', function ($http) {
    var recipeData = {};

    return {
      getAll: function () {
        return $http.get('/api/recipes/').success(function (data) {
          recipeData = data;
        })
      },
      getData: function () {
        return recipeData;
      }
    };
  }]);