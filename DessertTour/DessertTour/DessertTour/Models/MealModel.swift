//
//  DessertViewModel.swift
//  DessertTour
//
//  Created by Jibryll Brinkley on 5/9/23.
//

import Foundation

class MealModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchMeals() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Error fetching meals: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    self.meals = decodedData.meals.sorted { $0.strMeal < $1.strMeal }
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

