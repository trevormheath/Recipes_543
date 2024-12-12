//
//  RecipeCatalogView.swift
//  Recipes
//
//  Created by IS 543 on 11/19/24.
//

import SwiftUI
import SwiftData

struct RecipeCatalogView: View {
    @Environment(RecipeViewModel.self) private var viewModel
    @State private var isShowingForm = false
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: recipeList(
                    for: viewModel.recipes,
                    with: "All",
                    matching: searchText
                )
                ) {
                    Text("Browse all recipes")
                }
                NavigationLink(destination: recipeList(
                    for: viewModel.favoriteRecipes,
                    with: "Favorite",
                    matching: searchText
                )
                ) {
                    Text("View favorite recipes")
                }
                ForEach(viewModel.categories, id: \.self) { category in
                    NavigationLink(destination: recipeList(
                        for: viewModel.recipes(for: category),
                        with: category,
                        matching: searchText
                    )
                    ) {
                        Text(category)
                    }
                }
                .onDelete(perform: deleteCategory)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        } content: {
            recipeList(for: viewModel.recipes, with: "My", matching: searchText)
        } detail: {
            Text("Select a Recipe")
        }
    }
    
    private func deleteCategory(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                viewModel.deleteCategory(at: index)
            }
        }
    }
    
    private func enableForm() {
        withAnimation {
            isShowingForm = true
        }
    }
    
    private func deleteRecipe(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                viewModel.deleteRecipe(at: index)
            }
        }
    }
    
    private func recipeList(for recipes: [Recipe], with category: String, matching search: String) -> some View {
        var searchResults = recipes
        
        if (!search.isEmpty) {
            let lowerSearch = search.lowercased()
            searchResults = recipes.filter( {$0.title.lowercased().contains(lowerSearch) || $0.ingredients.lowercased().contains(lowerSearch) || $0.instructions.lowercased().contains(lowerSearch) || $0.metaInfo.lowercased().contains(lowerSearch)} )
        }
        
        return List {
            ForEach(searchResults) { recipe in
                NavigationLink(recipe.title, destination: RecipeDetailView(recipe: recipe))
            }
            .onDelete(perform: deleteRecipe)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: enableForm) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle(category + " Recipes")
        .sheet(isPresented: $isShowingForm) {
            RecipeFormView(currentCategory: category)
        }
    }
}
