//
//  MealDetail.swift
//  Fetch_TakeHome
//
//  Created by Yogesh Vishwanathan on 2/5/24.
//

import Foundation
struct MealDetail: Decodable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    var ingredients: [String: String?]

    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)

        var ingredientsDict = [String: String?]()
        for i in 1...20 {
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(i)")
            let measureKey = CodingKeys(rawValue: "strMeasure\(i)")

            if let ingredientKey = ingredientKey,
               let measureKey = measureKey,
               let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                let measure = try container.decodeIfPresent(String.self, forKey: measureKey)?.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsDict[ingredient] = measure
            }
        }
        self.ingredients = ingredientsDict
    }
}

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]
}
