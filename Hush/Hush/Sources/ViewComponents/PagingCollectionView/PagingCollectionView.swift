//
//  PagingCollectionView.swift
//  Hush
//
//  Created by Tomasz Kryg on 21/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class PagingCollectionView: UICollectionView {
    let layout: CollectionViewPagingLayout
    
    init(frame: CGRect) {
        layout = CollectionViewPagingLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
