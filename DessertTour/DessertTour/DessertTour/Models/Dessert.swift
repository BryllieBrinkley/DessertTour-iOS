//
//  Dessert.swift
//  DessertTour
//
//  Created by Jibryll Brinkley on 5/9/23.

import Foundation

struct Dessert: Decodable, Identifiable {
    let id: String
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strCategory: String
    let strInstructions: String
    
    private enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strMealThumb, strCategory, strInstructions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID().uuidString
        
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
    }
}
