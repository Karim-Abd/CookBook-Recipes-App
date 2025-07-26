//
//  RecipeData.swift
//  CookBook Recipes
//
//  Created by Karim  on 25/07/2025.
//

import Foundation

class RecipeData: ObservableObject {
  @Published var rec = Recipe.testRecipes
  
  func recipes(for category: MainInformation.Category) -> [Recipe] {
    var filteredRecipes = [Recipe]()
    for recipe in rec {
      if recipe.mainInformation.category == category {
        filteredRecipes.append(recipe)
      }
    }
      
      return filteredRecipes

  }
}
