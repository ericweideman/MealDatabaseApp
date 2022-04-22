//
//  ViewController.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/12/22.
//

import UIKit


class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var viewBackgroundImage: UIImageView!
    
    @IBOutlet weak var selectAMeal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectAMeal(_ sender: Any) {
        performSegue(withIdentifier: "showCategoryCollectionView", sender: sender)
    }
    
}

