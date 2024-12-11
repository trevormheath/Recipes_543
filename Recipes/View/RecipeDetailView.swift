//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by IS 543 on 12/10/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(RecipeViewModel.self) private var viewModel
    @Bindable var recipe: Recipe
    
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack {
            List {
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Ingredients:")
                    .font(.headline)
                Text(recipe.ingredients)
                Text("Instructions:")
                    .font(.headline)
                Text(recipe.instructions)
            }
        }
        .navigationTitle(recipe.title)
    }
}
