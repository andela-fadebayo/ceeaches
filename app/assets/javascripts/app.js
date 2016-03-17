angular.module('ceeaches', [
  'templates',
  'ui.router',
  'services'
])
  .config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
  }])
  .config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'index.html',
        controller: 'RecipesController'
      });

    $urlRouterProvider.otherwise('/')
  }]);
