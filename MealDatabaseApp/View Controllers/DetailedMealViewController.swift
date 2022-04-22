//
//  DetailedMealViewController.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/13/22.
//

import Foundation
import UIKit

class DetailedMealViewController: UIViewController {
    
    @IBOutlet weak var detailedMealScrollView: UIScrollView!
    @IBOutlet weak var detailedMealContentView: UIView!
    @IBOutlet weak var mealTitle: UIButton!
    @IBOutlet weak var imageViewFrame: UIView!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var ingredientsFrame: UIView!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var instructionsFrame: UIView!
    @IBOutlet weak var instructions: UILabel!
    
    var idMeal: String?
    var detailedMeal = MealsList()
    var strRecipe: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewFrame.layer.cornerRadius = 33
        mealImage.layer.cornerRadius = 33
        
        ingredientsFrame.layer.cornerRadius = 33
        ingredientsFrame.layer.masksToBounds = true

        instructionsFrame.layer.cornerRadius = 33
        instructionsFrame.layer.masksToBounds = true

        detailedMealContentView.backgroundColor = .clear
        detailedMealScrollView.backgroundColor = .clear
    
        MealDatabaseNetworkRequest.fetchMealInfo(idMeal) { response in
            DispatchQueue.main.async {
                self.detailedMeal = response
                let mealTitlestr = self.detailedMeal.meals[0].strMeal
                self.mealTitle.setTitle("\(mealTitlestr.capitalized)", for: .normal)
                self.downloadMealImage()
                self.ingredients.text = self.detailedMeal.meals[0].generateRecipe()
                self.ingredientsFrame.sizeToFit()
                self.instructions.text = self.detailedMeal.meals[0].strInstructions
                
                self.detailedMealScrollView.contentSize = self.detailedMealContentView.intrinsicContentSize
            }
        }
    }
}

extension DetailedMealViewController{
    
    func downloadMealImage(){
        guard let imgURLString = detailedMeal.meals[0].strMealThumb else {
            return
        }
        if let url = URL(string: imgURLString) {
            mealImage.downloaded(from: url)
        }
    }
}
