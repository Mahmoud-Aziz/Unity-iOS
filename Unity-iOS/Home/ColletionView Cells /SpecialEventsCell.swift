//
//  SpecialEventsCell.swift
//  Unity-iOS
//
//  Created by Mahmoud Aziz on 31/08/2021.
//

import UIKit

class SpecialEventsCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subTitle: String? {
        didSet {
            subTitleLabel.text = subTitle
        }
    }
    
}
