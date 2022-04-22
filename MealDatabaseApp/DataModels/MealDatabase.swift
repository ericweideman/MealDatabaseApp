//
//  MealDatabase.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/12/22.
//

import Foundation

import Foundation
import UIKit

class MealDatabase: NSObject, Codable {
    var categories: [Category] = []
}

class Category: Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
}

extension MealDatabase: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let optionCell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCell.reuseIdentifier, for: indexPath) as? OptionCell else {
        fatalError("Cell cannot be created")
      }
        
        let option: String = categories[indexPath.item].strCategory
        optionCell.option.setTitle("\(option)", for: .normal)
        return optionCell
    }
    
}
