//
//  RecipeDetailView.swift
//  CookBook Recipes
//
//  Created by Karim  on 26/07/2025.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack{
            HStack{
                Text("Recipe by: \(recipe.mainInformation.author)")
                
            }
            .font(.headline)
            .padding()
            HStack{
                Text(recipe.mainInformation.description)
            }
            Spacer()
            HStack{
                List{
                    Section("Ingredients"){
                        ForEach(recipe.ingredients.indices, id: \.self){ index in
                            let ingredient = recipe.ingredients[index]
                            Text(ingredient.description)
                            
                        }
                    }
                    Section("Steps"){
                        ForEach(recipe.directions.indices, id: \.self){ index in
                            let direction = recipe.directions[index]
                            
                            HStack{
                                Text("\(index + 1).")
                                Text("\(direction.isOptional ? "(Optional)" : "")")
                                    .bold()
                                    .foregroundStyle(.red)
                                Text(direction.description)

                            }
                            
                        }
                        
                    }
                }
                
            }
            Spacer()
            
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe: recipe)
        }
    }
}
