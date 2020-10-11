//
//  MenuCollectionViewCell.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.setMediumMargins()
        containerView.backgroundColor = .yellow
        containerView.layer.cornerRadius = .medium
    }

}
