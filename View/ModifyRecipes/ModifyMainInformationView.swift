//
//  ModifyMainInformationView.swift
//  CookBook Recipes
//
//  Created by Karim  on 30/07/2025.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form{
            
            TextField("Name", text: $mainInformation.name)
            TextField("Author", text: $mainInformation.author)
            
            Section(header: Text("Description")){
                TextEditor(text: $mainInformation.description)
            }
            
            
            Picker(selection: $mainInformation.category, label:
                    HStack{
                Text("Category")
                Spacer()
            }){
                ForEach(MainInformation.Category.allCases, id: \.self){ cat in
                    Text(cat.rawValue)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            
        }
    }
}

#Preview {
    ModifyMainInformationView(mainInformation: .constant(MainInformation(name: "Sample", description: "Test", author: "Karim", category: .lunch)))
}
