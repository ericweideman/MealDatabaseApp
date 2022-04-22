//
//  MealDatabaseNetworkRequest.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/12/22.
//

import Foundation
import UIKit

struct MealDatabaseNetworkRequest {
    
    static func fetchMealCategories(completed: @escaping (_ response: MealDatabase)->()) -> Void {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                print("data equals data")
                if let response = try? JSONDecoder().decode(MealDatabase.self, from: data) {
                    print("closure inside response works")
                    completed(response)
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }
        .resume()
    }
    
    static func fetchMealList(_ strFilter: String?,_ filterChar: String?,  completed: @escaping (_ response: MealsList)->()) -> Void {
        
        guard let filterChar = filterChar else {
            return
        }
        guard let strFilter = strFilter else {
            return 
        }
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?\(filterChar)=\(strFilter)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(MealsList.self, from: data) {
                    completed(response)
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }
        .resume()
    }
    
    static func fetchAreaList(completed: @escaping (_ response: MealsList)->()) -> Void {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?a=list") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(MealsList.self, from: data) {
                    completed(response)
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }
        .resume()
    }
    
    static func fetchMealInfo(_ idMeal: String?, completed: @escaping (_ response: MealsList)->()) -> Void {
        guard let idMeal = idMeal else {
            return
        }
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(MealsList.self, from: data) {
                    completed(response)
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }
        .resume()
    }
    
    static func downloadImage(_ imgURLString: String?) -> UIImageView {
        
        guard let imgURLString = imgURLString else {
            print("imgURLString failure")
            return UIImageView()
        }

        let image = UIImageView()
        let url = URL(string: imgURLString)
        if let url = url {
            image.downloaded(from: url)
            print("Image was downloaded")
            return image
        }
        return image
    }
}
