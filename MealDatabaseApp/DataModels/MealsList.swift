//
//  Meals.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/12/22.
//

import Foundation
import UIKit

class MealsList: NSObject, Codable {
    var meals: [Meal] = []
}

class Meal: Codable {
    
    var strMeal: String
    var strMealThumb: String?
    var idMeal: String
    
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: Date?

    func generateRecipe() -> String {

        var recipeDict: [String:String] = [:]
        var strRecipe: String = "Ingredients: \n \n"

        if let strIngredient1 = strIngredient1, let strMeasure1 = strMeasure1{
            recipeDict[strIngredient1] = strMeasure1
            }
        if let strIngredient2 = strIngredient2, let strMeasure2 = strMeasure2 {
            recipeDict[strIngredient2] = strMeasure2
            }
        if let strIngredient3 = strIngredient3, let strMeasure3 = strMeasure3 {
            recipeDict[strIngredient3] = strMeasure3
            }
        if let strIngredient4 = strIngredient4, let strMeasure4 = strMeasure4 {
            recipeDict[strIngredient4] = strMeasure4
            }
        if let strIngredient5 = strIngredient5, let strMeasure5 = strMeasure5 {
            recipeDict[strIngredient5] = strMeasure5
            }
        if let strIngredient6 = strIngredient6, let strMeasure6 = strMeasure6 {
            recipeDict[strIngredient6] = strMeasure6
            }
        if let strIngredient7 = strIngredient7, let strMeasure7 = strMeasure7 {
            recipeDict[strIngredient7] = strMeasure7
            }
        if let strIngredient8 = strIngredient8, let strMeasure8 = strMeasure8 {
            recipeDict[strIngredient8] = strMeasure8
        }
        if let strIngredient9 = strIngredient9, let strMeasure9 = strMeasure9 {
            recipeDict[strIngredient9] = strMeasure9
            }
        if let strIngredient10 = strIngredient10, let strMeasure10 = strMeasure10 {
            recipeDict[strIngredient10] = strMeasure10
            }
        if let strIngredient11 = strIngredient11, let strMeasure11 = strMeasure11 {
            recipeDict[strIngredient11] = strMeasure11
            }
        if let strIngredient12 = strIngredient12, let strMeasure12 = strMeasure12 {
            recipeDict[strIngredient12] = strMeasure12
            }
        if let strIngredient13 = strIngredient13, let strMeasure13 = strMeasure13 {
            recipeDict[strIngredient13] = strMeasure13
            }
        if let strIngredient14 = strIngredient14, let strMeasure14 = strMeasure14 {
            recipeDict[strIngredient14] = strMeasure14
            }
        if let strIngredient15 = strIngredient15, let strMeasure15 = strMeasure15 {
            recipeDict[strIngredient15] = strMeasure15
            }
        if let strIngredient16 = strIngredient16, let strMeasure16 = strMeasure16 {
            recipeDict[strIngredient16] = strMeasure16
            }
        if let strIngredient17 = strIngredient17, let strMeasure17 = strMeasure17 {
            recipeDict[strIngredient17] = strMeasure17
            }
        if let strIngredient18 = strIngredient18, let strMeasure18 = strMeasure18 {
            recipeDict[strIngredient18] = strMeasure18
            }
        if let strIngredient19 = strIngredient19, let strMeasure19 = strMeasure19 {
            recipeDict[strIngredient19] = strMeasure19
            }
        if let strIngredient20 = strIngredient20, let strMeasure20 = strMeasure20 {
            recipeDict[strIngredient20] = strMeasure20
            }
        
        for (ingredient, measure) in recipeDict {
            if ingredient == "" || measure == ""{
                continue
            }
            strRecipe.append("\(ingredient): \(measure) \n")
        }
        
        return strRecipe
    }
}

extension MealsList: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let optionCell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCell.reuseIdentifier, for: indexPath) as? OptionCell else {
        fatalError("Cell cannot be created")
      }
        
        let option: String = meals[indexPath.item].strMeal.capitalized
        optionCell.option.setTitle("\(option)", for: .normal)
        return optionCell
    }
    
}

