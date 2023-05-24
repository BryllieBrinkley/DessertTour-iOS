//
//  HomepageView.swift
//  DessertTour
//
//  Created by Jibryll Brinkley on 5/9/23.
//
import SwiftUI

struct MealListView: View {
    @ObservedObject var mealVM = MealModel()
    
    var body: some View {
        NavigationView {
            List(mealVM.meals) { meal in
                NavigationLink(destination: MealDetailView(meal: meal)) {
                    MealRow(meal: meal)
                }
            }
            .navigationTitle("Desserts")
        }
        .onAppear {
            mealVM.fetchMeals()
        }
    }
}

struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        HStack {
            if let url = URL(string: meal.strMealThumb),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
            } else {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 100, height: 100)
            }
            Text(meal.strMeal)
                .foregroundColor(.primary)
                .font(.headline)
                .lineLimit(2)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
