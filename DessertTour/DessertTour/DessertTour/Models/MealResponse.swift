//
//  MealResponse.swift
//  DessertTour
//
//  Created by Jibryll Brinkley on 5/21/23.
//

import Foundation

struct MealResponse: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    var id: String {
        idMeal
    }
}
