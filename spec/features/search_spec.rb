require 'spec_helper.rb'

feature 'Looking up recipes', js: true do
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
  end

  xscenario 'finding recipes' do
    visit '/'
    expect(page).to have_content('Baked Potato')
    expect(page).to have_content('Baked Brussel Sprouts')
  end
end