import Foundation

let sampleRecipes = [
    Recipe(
        title: "Chocolate Cake",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 2 cups flour
        - 1 cup sugar
        - 1 cup cocoa powder
        - 2 eggs
        - 1 cup milk
        """,
        instructions: """
        1. Preheat oven to 350°F.
        2. Mix dry ingredients in a bowl.
        3. Add wet ingredients and stir.
        4. Bake for 30 minutes.
        """,
        notes: """
        """,
        tags: "Dessert, Chocolate, Cake",
        isFavorite: true
    ),
    Recipe(
        title: "Spaghetti Carbonara",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 200g spaghetti
        - 100g pancetta
        - 2 eggs
        - 50g grated Parmesan
        - Black pepper
        """,
        instructions: """
        1. Boil pasta until al dente.
        2. Fry pancetta until crisp.
        3. Mix eggs with Parmesan.
        4. Combine pasta with pancetta and egg mixture.
        """,
        notes: """
        """,
        tags: "Italian, Main Dish",
        isFavorite: false
    ),
    Recipe(
        title: "Caesar Salad",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 1 head romaine lettuce
        - 50g Parmesan
        - 100g croutons
        - Caesar dressing
        """,
        instructions: """
        1. Chop lettuce into bite-sized pieces.
        2. Toss with dressing.
        3. Add Parmesan and croutons.
        """,
        notes: """
        """,
        tags: "Salad, Side",
        isFavorite: false
    ),
    Recipe(
        title: "Pancakes",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 1 cup flour
        - 2 tbsp sugar
        - 1 tsp baking powder
        - 1 egg
        - 1 cup milk
        """,
        instructions: """
        1. Mix dry ingredients.
        2. Add wet ingredients and whisk.
        3. Pour batter onto a hot griddle.
        4. Cook until golden brown.
        """,
        notes: """
        """,
        tags: "Breakfast",
        isFavorite: true
    ),
    Recipe(
        title: "Beef Stroganoff",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 500g beef strips
        - 1 onion, sliced
        - 2 cups mushrooms
        - 1 cup sour cream
        - 2 tbsp flour
        """,
        instructions: """
        1. Cook beef in a pan until browned.
        2. Sauté onions and mushrooms.
        3. Stir in sour cream and flour.
        4. Simmer for 10 minutes and serve over noodles.
        """,
        notes: """
        """,
        tags: "Main Dish",
        isFavorite: false
    ),
    Recipe(
        title: "Apple Pie",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 6 apples, peeled and sliced
        - 1/2 cup sugar
        - 1 tsp cinnamon
        - 1 pie crust
        """,
        instructions: """
        1. Preheat oven to 375°F.
        2. Mix apples, sugar, and cinnamon.
        3. Fill pie crust with apple mixture.
        4. Bake for 45 minutes.
        """,
        notes: """
        """,
        tags: "Dessert, Pie",
        isFavorite: true
    ),
    Recipe(
        title: "Avocado Toast",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 2 slices bread
        - 1 avocado
        - 1 tbsp olive oil
        - Salt and pepper
        """,
        instructions: """
        1. Toast bread slices.
        2. Mash avocado with olive oil, salt, and pepper.
        3. Spread avocado mixture on toast.
        """,
        notes: """
        """,
        tags: "Breakfast",
        isFavorite: false
    ),
    Recipe(
        title: "Chicken Stir Fry",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 500g chicken breast, sliced
        - 2 cups mixed vegetables
        - 2 tbsp soy sauce
        - 1 tbsp sesame oil
        """,
        instructions: """
        1. Cook chicken in sesame oil until browned.
        2. Add vegetables and stir-fry until tender.
        3. Mix in soy sauce and cook for 2 more minutes.
        """,
        notes: """
        """,
        tags: "Main Dish",
        isFavorite: true
    ),
    Recipe(
        title: "Greek Salad",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 2 tomatoes, chopped
        - 1 cucumber, sliced
        - 100g feta cheese
        - 1/4 cup olives
        - 2 tbsp olive oil
        """,
        instructions: """
        1. Combine tomatoes, cucumber, feta, and olives in a bowl.
        2. Drizzle with olive oil.
        3. Toss gently and serve.
        """,
        notes: """
        """,
        tags: "Salad, Side",
        isFavorite: false
    ),
    Recipe(
        title: "French Toast",
        metaInfo: """
            *Author*: ChatGPT
        """,
        ingredients: """
        - 4 slices bread
        - 2 eggs
        - 1/2 cup milk
        - 1 tsp cinnamon
        - 1 tbsp butter
        """,
        instructions: """
        1. Whisk eggs, milk, and cinnamon together.
        2. Dip bread slices in the egg mixture.
        3. Cook in butter on a hot pan until golden brown.
        """,
        notes: """
        """,
        tags: "Breakfast",
        isFavorite: true
    )
]
