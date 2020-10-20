//
//  StageTableViewCell.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class StageTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionAdapter: LevelCollectionViewAdapter = LevelCollectionViewAdapter()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewData: StageViewData) {
        collectionAdapter.setup(collectionView: collectionView, viewData: viewData)
    }
    
}
