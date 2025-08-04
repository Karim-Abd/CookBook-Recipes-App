//
//  ModifyRecipeView.swift
//  CookBook Recipes
//
//  Created by Karim  on 26/07/2025.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    @State private var selection = Selection.main
    
    var body: some View {
        VStack{
            
            Picker("Select Recipe Component:", selection: $selection){
                Text("MainInfo").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection{
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                ModifyIngredientsView(ingredients: $recipe.ingredients)
            case .directions:
                Text("Ingredients Editor")
            }
            Spacer()
            
        }
        
      
    }
    
    enum Selection{
        case main
        case ingredients
        case directions
    }
            }

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
    ModifyRecipeView(recipe: $recipe)
    }
}
