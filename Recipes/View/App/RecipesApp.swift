//
//  RecipesApp.swift
//  Recipes
//
//  Created by IS 543 on 11/19/24.
//

import SwiftUI
import SwiftData

@main
struct RecipesApp: App {
    let container: ModelContainer
    let viewModel: RecipeViewModel
    
    var body: some Scene {
        WindowGroup {
            RecipeCatalogView()
        }
        .modelContainer(container)
        .environment(viewModel)
    }
    
    init() {
        do {
            container = try ModelContainer(for: Recipe.self)
        } catch {
            fatalError("""
                    Failed to create ModelContainer for Recipe.  If you made a
                    change to the Model, then uninstall the app and restart it
                    from Xcode.
                    """)
        }
        viewModel = RecipeViewModel(container.mainContext)
    }
}


//var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
