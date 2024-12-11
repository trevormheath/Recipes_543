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
//    @Environment(\.modelContext) var modelContext
    
    @Binding var isPresented: Bool
    
    private var isEditExisting: Bool = false
    
    @State private var recipe: Recipe = Recipe(
        title: "",
        metaInfo: "",
        ingredients: "",
        instructions: "",
        notes: "",
        tags: "",
        isFavorite: false
    )
    
    init(isPresented: Binding<Bool>, inputRecipe: Recipe? = nil) {
        self._isPresented = isPresented
        
        if let inputRecipe {
            recipe.title = inputRecipe.title
            recipe.metaInfo = inputRecipe.metaInfo
            recipe.ingredients = inputRecipe.ingredients
            recipe.instructions = inputRecipe.instructions
            recipe.notes = inputRecipe.notes
            recipe.tags = inputRecipe.tags
            recipe.isFavorite = inputRecipe.isFavorite
            
            isEditExisting = true
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $recipe.title)
                TextField("Ingredients", text: $recipe.ingredients)
                TextField("Instructions", text: $recipe.instructions)
                TextField("Category", text: $recipe.tags)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveRecipe()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationBarTitle("New Recipe")
        }
    }
    
    private func saveRecipe() {
        if isEditExisting {
            viewModel.update(recipe)
        } else {
            viewModel.save(recipe)
        }
        
//        modelContext.insert(newRecipe)
//        
//        do {
//            try modelContext.save()
//        } catch {
//            print("Failed to save recipe: \(error.localizedDescription)")
//        }
    }
}
