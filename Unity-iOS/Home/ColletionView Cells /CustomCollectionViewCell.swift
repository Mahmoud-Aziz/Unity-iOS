//
//  CollectionViewCell.swift
//  Unity-iOS
//
//  Created by Mahmoud Aziz on 31/08/2021.
//

import UIKit

//third,fourth and fifth section custom cell
class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var label:UILabel!
    @IBOutlet private weak var image: UIImageView!
    
    var title: String? {
        didSet {
            label.text = title
        }
    }
    
    
}
