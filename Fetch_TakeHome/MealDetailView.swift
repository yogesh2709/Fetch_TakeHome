//
//  MealDetailView.swift
//  Fetch_TakeHome
//
//  Created by Yogesh Vishwanathan on 2/5/24.
//
import SwiftUI

struct MealDetailView: View {
    @ObservedObject var viewModel: MealDetailViewModel

    init(mealId: String) {
        viewModel = MealDetailViewModel(mealId: mealId)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.mealDetail?.meals[0].strMeal ?? "")
                    .font(.title)
                Text("Ingredients").font(.headline).padding(.vertical,5)
                ForEach(viewModel.ingredients, id: \.key) { key, value in
                    Text("\(key): \(value ?? "")")
                }
                Text("Instructions").font(.headline).padding(.vertical,5)
                Text(viewModel.mealDetail?.meals[0].strInstructions ?? "")
                    .padding(.top, 10)
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchMealDetail()
        }
    }
}
