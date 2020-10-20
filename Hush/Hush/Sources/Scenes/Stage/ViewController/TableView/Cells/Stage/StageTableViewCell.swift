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
    
    let collectionAdapter: LevelCollectionViewAdapter = LevelCollectionViewAdapter()

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionAdapter.setup(collectionView: collectionView)
    }
    
    func configure(color: Color) {
        
    }
    
}
