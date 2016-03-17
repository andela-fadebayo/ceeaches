require 'spec_helper'

describe Api::RecipesController do
  describe 'GET index' do
    before do
      Recipe.create!(
          name: 'Red Velvet Cake',
          by: 'Eleanor Johnson',
          description: 'A family favorite--great for the Christmas holiday.',
          directions: "{\"prep\":\"25 m\",\"cook\":\"30 m\",\"ready_in\":\"2 h 25 m\",\"step_1\":\"Preheat oven to 350 degrees F (175 degrees C). Grease two 9-inch round pans.\",\"step_2\":\"Beat shortening and 1 1/2 cups sugar until very light and fluffy. Add eggs and beat well.\",\"step_3\":\"Make a paste of cocoa and red food coloring; add to creamed mixture. Mix salt, 1 teaspoon vanilla, and buttermilk together. Add the flour to the batter, alternating with the buttermilk mixture, mixing just until incorporated. Mix soda and vinegar and gently fold into cake batter. Don't beat or stir the batter after this point.\",\"step_4\":\"Pour batter into prepared pans. Bake in preheated oven until a tester inserted into the cake comes out clean, about 30 minutes. Cool cakes completely on wire rack.\",\"step_5\":\"To Make Icing: Cook 5 tablespoons flour and milk over low heat till thick, stirring constantly. Let cool completely! While mixture is cooling, beat 1 cup sugar, butter, and 1 teaspoon vanilla until light and fluffy. Add cooled flour mixture and beat until frosting is a good spreading consistency. Frost cake layers when completely cool.\"}",
          ingredients: "{\"cake\":[\"1/2 cup shortening\",\"1 1/2 cups white sugar\",\"2 eggs\",\"2 tablespoons cocoa\",\"4 tablespoons red food coloring\",\"1 teaspoon salt\",\"1 teaspoon vanilla extract\",\"1 cup buttermilk\",\"2 1/2 cups sifted all-purpose flour\",\"1 1/2 teaspoons baking soda\",\"1 tablespoon distilled white vinegar\"],\"icing\":[\"5 tablespoons all-purpose flour\",\"1 cup milk\",\"1 cup white sugar\",\"1 cup butter, room temperature\",\"1 teaspoon vanilla extract\"]}",
          source: 'http://allrecipes.com/recipe/9295/red-velvet-cake/',
          favourites: 5,
          likes: 34,
          shares: 8,
          comments: 3
      )
      Recipe.create!(
          name: 'Irish Cream Chocolate Cheesecake',
          by: 'Elaine',
          description: 'If you like Irish cream and chocolate, you\'ll love this recipe. After numerous attempts with the ingredients this is the recipe I now use.',
          directions: "{\"prep\":\"20 m\",\"cook\":\"1 h 20 m\",\"ready_in\":\"9 h 20 m\",\"step_1\":\"Preheat oven to 350 degrees F (175 degrees C). In a large bowl, mix together the cookie crumbs, confectioners' sugar and 1/3 cup cocoa. Add melted butter and stir until well mixed. Pat into the bottom of a 9 inch springform pan. Bake in preheated oven for 10 minutes; set aside. Increase oven temperature to 450 degrees F (230 degrees C).\",\"step_2\":\"In a large bowl, combine cream cheese, white sugar, 1/4 cup cocoa and flour. Beat at medium speed until well blended and smooth. Add eggs one at a time, mixing well after each addition. Blend in the sour cream and Irish cream liqueur; mixing on low speed. Pour filling over baked crust.\",\"step_3\":\"Bake at 450 degrees F (230 degrees C) for 10 minutes. Reduce oven temperature to 250 degrees F (120 degrees C), and continue baking for 60 minutes.\",\"step_4\":\"With a knife, loosen cake from rim of pan. Let cool, then remove the rim of pan. Chill before serving. If your cake cracks, a helpful tip is to dampen a spatula and smooth the top, then sprinkle with some chocolate wafer crumbs.\"}",
          ingredients: "{\"cake\":[\"1 1/2 cups chocolate cookie crumbs\",\"1/3 cup confectioners' sugar1/3 cup unsweetened cocoa powder\",\"1/4 cup butter\",\"3 (8 ounce) packages cream cheese, softened\",\"1 1/4 cups white sugar\",\"1/4 cup unsweetened cocoa powder\",\"3 tablespoons all-purpose flour\",\"3 eggs\",\"1/2 cup sour cream\",\"1/4 cup Irish cream liqueur\"]}",
          source: 'http://allrecipes.com/recipe/7284/irish-cream-chocolate-cheesecake/',
          favourites: 7,
          likes: 12,
          shares: 4,
          comments: 9
      )

      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object['name'] }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns two results' do
      expect(results.size).to eq(2)
    end

    it 'should include Red Velvet' do
      expect(results.map(&extract_name)).to include('Red Velvet Cake')
    end

    it 'should include Irish Cream Chocolate' do
      expect(results.map(&extract_name)).to include('Irish Cream Chocolate Cheesecake')
    end
  end
end