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
                if !recipe.metaInfo.isEmpty {
                    Text(recipe.metaInfo)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Group {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, Constants.titlePadding)
                    Text(recipe.ingredients)
                        .padding(.bottom, Constants.groupPadding)
                }
                Group {
                    Text("Instructions:")
                        .font(.headline)
                        .padding(.bottom, Constants.titlePadding)
                    Text(recipe.instructions)
                        .padding(.bottom, Constants.groupPadding)
                }
                if !recipe.notes.isEmpty {
                    Group {
                        Text("Notes:")
                            .font(.headline)
                            .padding(.bottom, Constants.titlePadding)
                        Text(recipe.notes)
                            .padding(.bottom, Constants.groupPadding)
                    }
                }
                if !recipe.tags.isEmpty {
                    Text("Tags: \(recipe.tags)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Toggle("Is Favorite", isOn: $recipe.isFavorite)
                    .padding(.top, Constants.favoritePadding)
            }
            .onChange(of: recipe.isFavorite) { viewModel.refreshData() }
            .toolbar {
                ToolbarItem {
                    Button(action: editRecipe) {
                        Text("Edit")
                    }
                }
            }
            .navigationTitle(recipe.title)
        }
        .sheet(isPresented: $isEditing) {
            RecipeFormView(inputRecipe: recipe)
        }
    }
    
    private func editRecipe() {
        withAnimation {
            isEditing = true
        }
    }
    
    private struct Constants {
        static let groupPadding: CGFloat = 8
        static let titlePadding: CGFloat = 4
        static let favoritePadding: CGFloat = 16
    }
}
