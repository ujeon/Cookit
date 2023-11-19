//
//  Meal.swift
//  Cookit
//
//  Created by 우전 on 11/19/23.
//

import Foundation

struct Result: Codable {
  let meals: [Meal]
}

struct Meal: Codable, Identifiable {
  let id: String
  let name: String
  let category: String
  let area: String
  let instructions: String
  let thumbnail: String
  let tags: String?
  let youtube: String
  
  enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case name = "strMeal"
    case category = "strCategory"
    case area = "strArea"
    case instructions = "strInstructions"
    case thumbnail = "strMealThumb"
    case tags = "strTags"
    case youtube = "strYoutube"
  }
}

@Observable
class MealModel {
  enum LoadingState {
    case beforeSearch, loading, loaded, failed
  }
  
  var searchText: String = ""
  var meals: [Meal] = []
  var loading: LoadingState = .beforeSearch
  
  func fetchRecipe() async {
    let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchText)"
    
    print(urlString)
    
    guard let url = URL(string: urlString) else {
      print("Bad URL: \(urlString)")
      return
    }
    
    do {
      loading = .loading
      let (data, _) = try await URLSession.shared.data(from: url)
      let result = try JSONDecoder().decode(Result.self, from: data)
      loading = .loaded
      meals = result.meals
    } catch let error as DecodingError {
      loading = .failed
      print("DecordingError: \(error)")
    } catch {
      print("Error: \(error)")
    }
    
  }
}



