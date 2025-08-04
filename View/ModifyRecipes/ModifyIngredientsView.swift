//
//  ModifyIngredientsView.swift
//  CookBook Recipes
//
//  Created by Karim  on 01/08/2025.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State var newIngredient = Ingredient()



    
    var body: some View {
        if ingredients.isEmpty {
            NavigationLink("Enter New Ingredient", destination: addIngredientView)
        } else{
            
            VStack{
                List{
                    ForEach(ingredients.indices, id: \.self) { index in
                        let currentIngredient = ingredients[index]
                        Text(currentIngredient.name)
                    }
                    Section("Add more Ingredients"){
                        
                        NavigationLink("Enter more Ingredients", destination: addIngredientView)
                        
                        
                    }
                }
           
            }
        }
    }
    
    var addIngredientView: some View {
        ModifyIngredientView(ingredient: $newIngredient) { ingredient in
            ingredients.append(ingredient)
            newIngredient = Ingredient(name: "", quantity: 1, unit: .g)
        }
    }
}



struct ModifyIngredientsView_Previews: PreviewProvider {
  @State static var emptyIngredients = [Ingredient]()
  static var previews: some View {
    NavigationView {
      ModifyIngredientsView(ingredients: $emptyIngredients)
    }
  }
}
