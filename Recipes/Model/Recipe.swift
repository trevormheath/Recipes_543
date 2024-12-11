//
//  Item.swift
//  Recipes
//
//  Created by IS 543 on 11/14/24.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    var title: String
    var metaInfo: String
    var ingredients: String
    var instructions: String
    var notes: String
    var tags: String
    var isFavorite: Bool
    
    init(
        title: String,
        metaInfo: String,
        ingredients: String,
        instructions: String,
        notes: String,
        tags: String,
        isFavorite: Bool
    ) {
        self.title = title
        self.metaInfo = metaInfo
        self.ingredients = ingredients
        self.instructions = instructions
        self.notes = notes
        self.tags = tags
        self.isFavorite = isFavorite
    }
}
