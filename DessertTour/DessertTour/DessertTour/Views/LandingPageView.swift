//
//  ContentView.swift
//  DessertTour
//
//  Created by Jibryll Brinkley on 5/9/23.
//

import SwiftUI


struct LandingPageView: View {
    
    let timerInterval = 2.0
    @State private var isPresentingNextView = false
    
    var body: some View {
        ZStack {
            Color(red: 110/255, green: 222/255, blue: 228/255)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Image("Dessert")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("Dessert Tour")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 50)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + timerInterval) {
                withAnimation {
                    isPresentingNextView = true
                }
            }
        }
        .fullScreenCover(isPresented: $isPresentingNextView) {
            MealListView()
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

