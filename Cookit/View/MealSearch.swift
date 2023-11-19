//
//  MealSearch.swift
//  Cookit
//
//  Created by 우전 on 11/19/23.
//

import SwiftUI

struct MealSearch: View {
  @State var mealModel = MealModel()
  
  var body: some View {
    NavigationView {
      List(mealModel.meals) { meal in
        MealCard(meal: meal)
          .listRowSeparator(.hidden)
      }
    }
    .listStyle(.plain)
    .navigationTitle("Find Your Meal")
    .searchable(text: $mealModel.searchText)
    .onSubmit(of: .search) {
      Task() {
        await mealModel.fetchRecipe()
      }
      
    }
  }
}

#Preview {
  MealSearch()
}
