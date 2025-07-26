//
//  ContentView.swift
//  CookBook Recipes
//
//  Created by Karim  on 25/07/2025.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject var recipeData: RecipeData
    let category: MainInformation.Category
    
    var body: some View {
        List{
            ForEach(recipes){ recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
        }
        .navigationTitle(category.rawValue)
    }
}

extension RecipesListView{
    private var recipes: [Recipe] {
       recipeData.recipes(for: category)
     }
      
      private var navigationTitle: String {
        "\(category.rawValue) Recipes"
      }
    }



struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RecipesListView(category: .breakfast)
        .environmentObject(RecipeData())
    }
  }
}
