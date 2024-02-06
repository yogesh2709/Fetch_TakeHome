//
//  MealService.swift
//  Fetch_TakeHome
//
//  Created by Yogesh Vishwanathan on 2/5/24.
//

import Foundation

class MealService {
    static let shared = MealService()

    private let decoder = JSONDecoder()
    private let session = URLSession.shared
    private let baseUrl = "https://www.themealdb.com/api/json/v1/1/"

    func fetchMeals(completion: @escaping (Result<MealList, Error>) -> Void) {
        let url = URL(string: "\(baseUrl)filter.php?c=Dessert")!

        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let meals = try self.decoder.decode(MealList.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(meals))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    func fetchMealDetail(mealId: String, completion: @escaping (Result<MealDetailResponse, Error>) -> Void) {
        let url = URL(string: "\(baseUrl)lookup.php?i=\(mealId)")!

        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                       return
                   }

            if let data = data {
                do {
                    let mealDetail = try self.decoder.decode(MealDetailResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(mealDetail))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
