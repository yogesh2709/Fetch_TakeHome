//
//  MealDetailViewModel.swift
//  Fetch_TakeHome
//
//  Created by Yogesh Vishwanathan on 2/5/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetailResponse?
    var ingredients: [(key: String, value: String?)] {
        mealDetail?.meals[0].ingredients.sorted { $0.key < $1.key } ?? []
    }

    private let mealId: String

    init(mealId: String) {
        self.mealId = mealId
    }

    func fetchMealDetail() {
        MealService.shared.fetchMealDetail(mealId: mealId) { [weak self] result in
            switch result {
            case .success(let mealDetail):
                self?.mealDetail = mealDetail
            case .failure(let error):
                // Handle error
                print(error.localizedDescription)
            }
        }
    }
}
