//
//  MealCard.swift
//  Cookit
//
//  Created by 우전 on 11/19/23.
//

import SwiftUI

struct MealCard: View {
  var meal: Meal
  
  var gradient: LinearGradient {
    .linearGradient(
      Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
      startPoint: .bottom,
      endPoint: .center)
  }
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      
      AsyncImage(url: URL(string: meal.thumbnail)) { image in
        image.resizable()
      } placeholder: {
        HStack(alignment: .center) {
          ProgressView()
            .alignmentGuide(HorizontalAlignment.center) { _ in 0}
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: 400)
      }
      
      gradient
      
      HStack {
        VStack(alignment: .leading) {
          Text(meal.area)
            .font(.title2)
          Text(meal.name)
            .font(.title)
            .bold()
        }
      }
      .padding()
      .foregroundColor(.white)
    }
    .cornerRadius(12)
    .frame(maxWidth: .infinity, maxHeight: 400)
    
    
  }
}

#Preview {
  let mealModel = MealModel()
  return MealCard(meal: mealModel.meals[0])
}

