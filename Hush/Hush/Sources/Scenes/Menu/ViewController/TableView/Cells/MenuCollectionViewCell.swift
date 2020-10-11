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
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with viewData: MenuViewData) {
        containerView.backgroundColor = viewData.color.secondary
        imageView.image = UIImage(named: viewData.imageName)
        imageView.tintColor = viewData.color.tertiary
        containerView.addScaledTap(onSuccess: {
            viewData.action()
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.setWideMargins()
        containerView.setWideMargins()
        containerView.layer.cornerRadius = .small
    }

}
