//
//  CategoryCollectionViewController.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/17/22.
//

import Foundation
import UIKit


class CategoryCollectionViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var mealDatabase = MealDatabase()
    let delegate = CategoryCollectionViewDelegate(numberOfItemsPerRow: 2, interItemSpacing: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.backgroundView = nil
        categoryCollectionView.backgroundColor = .clear
        
        MealDatabaseNetworkRequest.fetchMealCategories { response in
            DispatchQueue.main.async {
                self.mealDatabase = response
                self.categoryCollectionView.dataSource = self.mealDatabase
                self.categoryCollectionView.delegate = self.delegate
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showMealCollectionView",
            let optionCell = sender as? OptionCell,
            let mealCollectionViewController = segue.destination as? MealCollectionViewController,
            let indexPath = categoryCollectionView.indexPath(for: optionCell) else {
            return
    }
        mealCollectionViewController.strFilter = mealDatabase.categories[indexPath.item].strCategory.capitalized
        mealCollectionViewController.filterChar = "c"
}

}

