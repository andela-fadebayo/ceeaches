describe("RecipesController", function() {
  var ctrl, stateParams, scope, setupController, httpBackend;

  scope = null;
  ctrl = null;
  stateParams = null;

  // access injected service later
  httpBackend = null;

  setupController = function(res) {
    return inject(function($stateParams, $rootScope, $controller, $httpBackend) {
      scope = $rootScope.$new();
      stateParams = $stateParams;

      // capture the injected service
      httpBackend = $httpBackend;

      httpBackend.expectGET('/api/recipes/').respond(res);

      return ctrl = $controller('RecipesController', {
        $scope: scope,
        $location: location
      });
    });
  };

  beforeEach(module("ceeaches"));
  beforeEach(setupController());

  afterEach(function() {
    httpBackend.verifyNoOutstandingExpectation();
    httpBackend.verifyNoOutstandingRequest();
  });

  describe('controller initialization', function() {
    var recipes;

    recipes = [
      { id: 2, name: 'Red Velvet Cake' },
      { id: 4, name: 'Irish Cream Chocolate Cheesecake' }
    ];

    beforeEach(function() {
      setupController(recipes);
      httpBackend.flush();
    });

    it('gets all recipes from the back-end', function() {
      expect(scope.recipes).toEqualData(recipes);
    });
  });

  //describe('search()', function() {
  //  beforeEach(function() {
  //    setupController();
  //  });
  //
  //  it('redirects to itself with a keyword param', function() {
  //    var keywords;
  //
  //    keywords = 'foo';
  //    scope.search(keywords);
  //    expect(location.path()).toBe('/');
  //    expect(location.search()).toEqualData({keywords: keywords});
  //  });
  //});
});
