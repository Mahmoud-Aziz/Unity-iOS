//
//  HeaderView.swift
//  Unity-iOS
//
//  Created by Mahmoud Aziz on 31/08/2021.
//

import UIKit

class HeaderView: UICollectionReusableView {

    @IBOutlet private weak var titleLabel: UILabel!

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
}
