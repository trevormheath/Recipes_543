//
//  RecipeCatalogView.swift
//  Recipes
//
//  Created by IS 543 on 11/19/24.
//

import SwiftUI
import SwiftData

struct RecipeCatalogView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var recipes: [Recipe]
    @Environment(RecipeViewModel.self) private var viewModel
    
    @State private var searchText: String = ""
//    @State private var selectedCategory: String?
//    @State private var selectedRecipe: Recipe?
    
    @State private var isShowingForm = false
    
//    var categories: [String] {
//        let recipeCategories = Array(Set(recipes.map { $0.tags })).sorted()
//        return ["View All"] + recipeCategories
//    }
    
    var body: some View {
        NavigationSplitView {
//            List(categories, id: \.self, selection: $selectedCategory) { category in
//                Text(category)
//                    .tag(category)
//            }
//            .navigationTitle("Categories")
            List {
                NavigationLink(destination: recipeList(
                    for: viewModel.recipes,
                    with: "All Recipes"
                    )
                ) {
                    Text("Browse all recipes")
                }
                NavigationLink(destination: recipeList(
                    for: viewModel.favoriteRecipes,
                    with: "Favorites"
                    )
                ) {
                    Text("View favorite recipes")
                }
                ForEach(viewModel.categories, id: \.self) {category in
                    NavigationLink(destination: recipeList(
                        for: viewModel.recipes(for: category),
                        with: "\(category) Recipes"
                        )
                    ) {
                        Text(category)
                    }
                }
            }
            .sheet(isPresented: $isShowingForm) {
                RecipeFormView(isPresented: $isShowingForm)
            }
        } content: {
            recipeList(for: viewModel.recipes, with: "My recipes")
//            if let selectedCategory = selectedCategory {
//                
//                let filteredRecipes =  selectedCategory != "View All" ? recipes.filter { $0.tags == selectedCategory } : recipes
//                
//                List(selection: $selectedRecipe) {
//                    ForEach(filteredRecipes) { recipe in
//                        Text(recipe.title)
//                            .tag(recipe)
//                    }
//                    .onDelete(perform: deleteRecipe)
//                }
//                .searchable(text: $searchText)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        EditButton()
//                    }
//                    ToolbarItem {
//                        Button("Add Recipe", systemImage: "plus") {
//                            isShowingForm = true
//                        }
//                    }
//                }
//                .navigationTitle(selectedCategory)
//                .sheet(isPresented: $isShowingForm) {
//                    RecipeFormView(isPresented: $isShowingForm)
//                }
//            } else {
//                Text("Select a Category")
//                    .foregroundStyle(.secondary)
//            }
        } detail: {
            Text("Select a Recipe")
//            if let selectedRecipe = selectedRecipe {
//
//            } else {
//                Text("Select a Recipe")
//                    .foregroundStyle(.secondary)
//            }
            
        }
        
        //just for testing
//        .onAppear {
//            insertTestData(using: modelContext)
//        }
    }
    private func addItem() {
        withAnimation {
            isShowingForm = true
        }
    }
    
    private func recipeList(for recipes: [Recipe], with title: String) -> some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.title, destination: RecipeDetailView(recipe: recipe))
            }
            .onDelete(perform: deleteRecipe)
        }
        
        .toolbar {
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        
        .navigationTitle(title)
    }

//    private func addRecipe() {
//        withAnimation {
//            let newRecipe = Recipe(
//                title: "New Recipe",
//                ingredients: "Sample Ingredients",
//                instructions: "Sample Instructions",
//                category: "Desserts"
//            )
//            modelContext.insert(newRecipe)
//        }
//    }
//
    private func deleteRecipe(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                viewModel.deleteRecipe(at: index)
            }
        }
    }
}

//#Preview {
//    RecipeCatalogView()
//        .modelContainer(for: Recipe.self, inMemory: true)
//}
