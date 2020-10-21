//
//  CollectionViewPagingLayout.swift
//  Hush
//
//  Created by Tomasz Kryg on 21/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

public class CollectionViewPagingLayout: UICollectionViewFlowLayout {
    
    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        let pageWidth: CGFloat = self.itemSize.width + self.minimumInteritemSpacing
        let approximatePage = collectionView.contentOffset.x/pageWidth
        let currentPage = velocity.x == 0 ? round(approximatePage) : (velocity.x < 0.0 ? floor(approximatePage) : ceil(approximatePage))
        let flickVelocity = velocity.x * 2.0
        let flickedPages = (abs(round(flickVelocity)) <= 1) ? 0 : round(flickVelocity)
        let newHorizontalOffset = ((currentPage + flickedPages) * pageWidth) - collectionView.contentInset.left
        return CGPoint(x: newHorizontalOffset, y: proposedContentOffset.y)
    }
}
