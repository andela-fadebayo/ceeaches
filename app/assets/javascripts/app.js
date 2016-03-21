angular.module('ceeaches', [
  'templates',
  'ui.router',
  'controllers',
  'services'
])
  .config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
  }])
  .config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'home.html',
        controller: 'HomeController'
      })
      .state('recipe', {
        url: '/recipe/:id',
        templateUrl: 'recipe.html',
        controller: 'RecipeController'
      });

    $urlRouterProvider.otherwise('/')
  }]);
