//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by IS 543 on 12/10/24.
//

import Foundation
import SwiftData

@Observable
class RecipeViewModel {
    
    private var modelContext: ModelContext
    
    init(_ modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    private(set) var recipes: [Recipe] = []
    private(set) var favoriteRecipes: [Recipe] = []
    private(set) var categories: [String] = []
    
    func recipes(for category: String) -> [Recipe] {
        return recipes.filter{
            $0.tags.lowercased().contains(category.lowercased())
        }
    }
    
    func refreshData() {
        fetchData()
    }
    
    func save(_ recipe: Recipe) {
        modelContext.insert(recipe)
        fetchData()
    }
    
    func update(_ recipe: Recipe) {
        saveAllChanges()
        fetchData()
    }
    
    func deleteRecipe(at index: Int) {
        modelContext.delete(recipes[index])
        saveAllChanges()
        fetchData()
    }
    
    private func fetchData() {
        saveAllChanges()
        
        fetchRecipes()
        fetchFavorites()
        gatherTags()
        
        if recipes.isEmpty {
            sampleRecipes.forEach { modelContext.insert($0) }
            fetchData()
        }
    }
    
    private func fetchRecipes() {
        let fetchDescriptor = FetchDescriptor<Recipe>(sortBy: [SortDescriptor(\.title)])
        
        do {
            recipes = try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch recipes: \(error)")
        }
    }
    
    private func fetchFavorites() {
        let fetchDescriptor = FetchDescriptor<Recipe>(
            predicate: #Predicate<Recipe> { $0.isFavorite },
            sortBy: [SortDescriptor(\.title)]
        )
        
        do {
            favoriteRecipes = try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch favorite recipes: \(error)")
        }
    }
    
    private func gatherTags() {
        var tags: Set<String> = []
        
        recipes.forEach { recipe in
            let tagParts = recipe.tags.split(separator: ",")
            
            tagParts.forEach { tag in
                let canonicalTag = tag.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
                
                if !tags.contains(canonicalTag) {
                    tags.insert(canonicalTag)
                }
            }
        }
        
        categories = Array(tags)
    }
    
    private func saveAllChanges() {
        try? modelContext.save()
    }
}
