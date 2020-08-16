//
//  BoardCollectionViewCell.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class BoardCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewData: BoardViewData) {
        self.backgroundColor = viewData.color
    }
    
    func refresh(with viewData: BoardViewData) {
        UIView.animate(withDuration: 0.3) {
            self.configure(with: viewData)
        }
    }

}
