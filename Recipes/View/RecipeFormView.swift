//
//  RecipeFormView.swift
//  Recipes
//
//  Created by IS 543 on 12/3/24.
//

import Foundation
import SwiftUI

struct RecipeFormView: View {
    @Environment(RecipeViewModel.self) private var viewModel
    @Environment(\.dismiss) var dismiss
    private var isEditMode: Bool = false
    let recipeRef: Recipe?
    
    @State private var formRecipe: Recipe = Recipe(
        title: "",
        metaInfo: "",
        ingredients: "",
        instructions: "",
        notes: "",
        tags: "",
        isFavorite: false
    )
    
    init(currentCategory: String = "", inputRecipe: Recipe? = nil) {
        self.recipeRef = inputRecipe
        
        if let inputRecipe {
            formRecipe.title = inputRecipe.title
            formRecipe.metaInfo = inputRecipe.metaInfo
            formRecipe.ingredients = inputRecipe.ingredients
            formRecipe.instructions = inputRecipe.instructions
            formRecipe.notes = inputRecipe.notes
            formRecipe.tags = inputRecipe.tags
            formRecipe.isFavorite = inputRecipe.isFavorite
            
            isEditMode = true
        } else {
            //have a default category if recipe added while category selected
            if (!currentCategory.isEmpty && currentCategory != "All" && currentCategory != "Favorite") {
                formRecipe.tags = currentCategory
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Recipe Name", text: $formRecipe.title)
                TextField("Meta Info", text: $formRecipe.metaInfo)
                TextEditorPlus(placeholder: "Ingredients", text: $formRecipe.ingredients)
                TextEditorPlus(placeholder: "Instructions", text: $formRecipe.instructions)
                TextEditorPlus(placeholder: "Notes", text: $formRecipe.notes)
                TextField("Tags (e.g. Dessert, Chocolate, Cake)", text: $formRecipe.tags)
                Toggle("Is Favorite", isOn: $formRecipe.isFavorite)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveRecipe()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationBarTitle("\(isEditMode ? "Edit" : "New") Recipe")
        }
    }
    
    private func saveRecipe() {
        if isEditMode {
            if let recipeRef {
                recipeRef.title = formRecipe.title
                recipeRef.metaInfo = formRecipe.metaInfo
                recipeRef.ingredients = formRecipe.ingredients
                recipeRef.instructions = formRecipe.instructions
                recipeRef.notes = formRecipe.notes
                recipeRef.tags = formRecipe.tags
                recipeRef.isFavorite = formRecipe.isFavorite
            }
            viewModel.refreshData()
            dismiss()
        } else {
            viewModel.save(formRecipe)
        }
    }
}
