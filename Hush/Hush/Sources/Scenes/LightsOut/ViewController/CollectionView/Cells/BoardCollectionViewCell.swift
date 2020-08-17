//
//  BoardCollectionViewCell.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class BoardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lightView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepareView()
    }
    
    private func prepareView() {
        let value = bounds.height/10
        contentView.setMargin(value/2.5)
        lightView.layer.cornerRadius = value
    }
    
    func configure(with viewData: BoardViewData) {
        self.lightView.backgroundColor = viewData.color
    }
    
    func refresh(with viewData: BoardViewData) {
        UIView.animate(withDuration: 0.3) {
            self.configure(with: viewData)
        }
    }
    
    func hinted() {
        backgroundColor = .red
    }
    
    func unhinted() {
        backgroundColor = .clear
    }

}
