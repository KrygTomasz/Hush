//
//  StageTableViewCell.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class StageTableViewCell: UITableViewCell {

    lazy var collectionView: PagingCollectionView = {
        return PagingCollectionView(frame: frame)
    }()
    
    private let collectionAdapter: LevelCollectionViewAdapter = LevelCollectionViewAdapter()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configure(viewData: StageViewData) {
        collectionAdapter.setup(collectionView: collectionView, viewData: viewData)
    }
    
}
