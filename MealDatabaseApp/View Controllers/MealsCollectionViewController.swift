//
//  MealsCollectionViewController.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/17/22.
//

import Foundation
import UIKit


class MealsCollectionViewController: UIViewController{
    
    @IBOutlet weak var mealsCollectionView: UICollectionView!
    
    var strFilter: String?
    var filterChar: String?
    var mealsList = MealsList()
    var delegate = CollectionViewDelegate(numberOfItemsPerRow: 1, interItemSpacing: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealsCollectionView.backgroundView = nil
        mealsCollectionView.backgroundColor = .clear
        
        MealDatabaseNetworkRequest.fetchMealList(strFilter, filterChar) { response in
            DispatchQueue.main.async {
                self.mealsList = response
                self.mealsCollectionView.dataSource = self.mealsList
                self.mealsCollectionView.delegate = self.delegate
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetailedMealFromMealCollection",
              let optionCell = sender as? OptionCell,
              let detailedMealViewController = segue.destination as? DetailedMealViewController,
              let indexPath = mealsCollectionView.indexPath(for: optionCell)
        else{
            return
        }
        detailedMealViewController.idMeal =  mealsList.meals[indexPath.item].idMeal
        
    }
}


