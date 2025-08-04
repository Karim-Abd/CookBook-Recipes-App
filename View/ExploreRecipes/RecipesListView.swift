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
    @State private var isPresenting: Bool = false
    @State private var newRecipe = Recipe()
    
    var body: some View {
        List{
            ForEach(recipes){ recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
        }
        .navigationTitle(category.rawValue)
        
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing){
                Button(action:{
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                }
                )
            }
        })
        .sheet(isPresented: $isPresenting, content:{
            NavigationView{
                ModifyRecipeView(recipe: $newRecipe)
                    .navigationTitle("Add new recipe")
                    .toolbar(content:{
                        
                        ToolbarItem(placement: .navigationBarLeading){
                            Button("Dismess"){
                                isPresenting = false
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing){
                            if newRecipe.isValid{
                                Button("Add"){
                                    recipeData.add(recipe: newRecipe)
                                isPresenting = false
                            }
                                
                            }
                            
                               
                        }
                       
                    })
            }
        })
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
