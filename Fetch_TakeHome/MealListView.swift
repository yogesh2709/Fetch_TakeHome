//
//  MealListView.swift
//  Fetch_TakeHome
//
//  Created by Yogesh Vishwanathan on 2/5/24.
//

import SwiftUI

struct MealListView: View {
    @ObservedObject var viewModel: MealListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                    MealRow(meal: meal)
                }
            }
            .navigationTitle("Desserts") 
            .onAppear {
                viewModel.fetchMeals()
            }
        }
    }
}

struct MealRow: View {
    let meal: Meal

    var body: some View {
        HStack {
            // Display meal thumbnail if available
            if let imageUrl = meal.strMealThumb, let url = URL(string: imageUrl) {
                AsyncImage(url: url)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            Text(meal.strMeal)
        }
    }
}
