import Foundation

class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    func fetchMeals() {
        MealService.shared.fetchMeals { [weak self] result in
            switch result {
            case .success(let mealList):
                self?.meals = mealList.meals.sorted { $0.strMeal < $1.strMeal }
            case .failure(let error):
                // Handle error
                print(error.localizedDescription)
            }
        }
    }
}

