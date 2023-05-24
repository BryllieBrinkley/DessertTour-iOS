//
//  MealDetailView.swift
//  DessertTour
//
//  Created by Jibryll Brinkley on 5/9/23.

import SwiftUI

class MealDetailModel: ObservableObject {
    let meal: Meal
    @Published var dessertDetails: DessertDetails?
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    func fetchMealDetails(completion: @escaping (DessertDetails?) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Empty data received")
                completion(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(DessertResponse.self, from: data)
                let dessertDetails = decodedData.meals.first
                completion(dessertDetails)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

struct MealDetailView: View {
    let meal: Meal
    @StateObject var mealDetailModel: MealDetailModel
    
    init(meal: Meal) {
        self.meal = meal
        self._mealDetailModel = StateObject(wrappedValue: MealDetailModel(meal: meal))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if let url = URL(string: meal.strMealThumb),
                   let data = try? Data(contentsOf: url),
                   let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 200, height: 200)
                        .padding()
                }
                
                Text(meal.strMeal)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                if let dessertDetails = mealDetailModel.dessertDetails {
                    VStack(alignment: .center) {
                        Text("Ingredients:")
                            .font(.title)
                            .padding()
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(dessertDetails.ingredients.indices, id: \.self) { index in
                                let ingredient = dessertDetails.ingredients[index]
                                let measurement = dessertDetails.measurements[index]
                                Text("- \(measurement) \(ingredient)")
                                    .font(.body)
                            }
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Instructions:")
                            .font(.headline)
                            .padding(.bottom, 4)
                        
                        Text(dessertDetails.instructions)
                            .font(.body)
                            .padding(.bottom, 2)
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
        .navigationTitle("Dessert Details")
        .onAppear {
            mealDetailModel.fetchMealDetails { dessertDetails in
                mealDetailModel.dessertDetails = dessertDetails
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let meal = Meal(idMeal: "1", strMeal: "Dessert", strMealThumb: "https://www.example.com/image.jpg")
        MealDetailView(meal: meal)
    }
}
