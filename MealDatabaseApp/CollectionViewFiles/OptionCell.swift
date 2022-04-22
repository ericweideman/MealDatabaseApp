//
//  OptionCell.swift
//  MealDatabaseApp
//
//  Created by Eric Weideman on 4/17/22.
//

import Foundation
import UIKit

class OptionCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: OptionCell.self)
    
    @IBOutlet weak var option: UIButton!
}
