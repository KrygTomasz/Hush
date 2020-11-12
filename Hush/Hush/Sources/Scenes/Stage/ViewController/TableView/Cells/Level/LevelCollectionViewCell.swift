//
//  LevelCollectionViewCell.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = .medium
        titleLabel.textAlignment = .center
        titleLabel.bold(.large)
    }
    
    func configure(with viewData: LevelViewData) {
        containerView.backgroundColor = viewData.color.secondary
        titleLabel.text = viewData.title
        titleLabel.textColor = viewData.color.tertiary
        containerView.addBorder(color: viewData.color.tertiary)
    }

}
