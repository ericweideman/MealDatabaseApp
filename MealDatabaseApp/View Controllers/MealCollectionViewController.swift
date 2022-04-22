//
//  MealCollectionViewController.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/20/22.
//

import Foundation
import UIKit

class MealCollectionViewController: UIViewController{
    
    @IBOutlet weak var mealCollectionView: UICollectionView!
    
    var strFilter: String?
    var filterChar: String?
    var mealsList = MealsList()
    let delegate = CategoryCollectionViewDelegate(numberOfItemsPerRow: 1, interItemSpacing: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealCollectionView.backgroundView = nil
        mealCollectionView.backgroundColor = .clear
        
        MealDatabaseNetworkRequest.fetchMealList(strFilter, filterChar) { response in
            DispatchQueue.main.async {
                self.mealsList = response
                self.mealCollectionView.dataSource = self.mealsList
                self.mealCollectionView.delegate = self.delegate
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showDetailedMealFromMealList",
                let optionCell = sender as? OptionCell,
            let detailedMealViewController = segue.destination as? DetailedMealViewController,
            let indexPath = mealCollectionView.indexPath(for: optionCell) else{
            print("Detailed Meal View from Meal List failed")
            return
        }
        let mealNumber = mealsList.meals[indexPath.item].idMeal
        print("\(mealNumber)")
        detailedMealViewController.idMeal = mealNumber
        
    }
}


