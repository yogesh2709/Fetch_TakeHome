//
//  Meal.swift
//  Fetch_TakeHome
//
//  Created by Yogesh Vishwanathan on 2/5/24.
//
import Foundation

struct MealList: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?

    var id: String { idMeal }
}
