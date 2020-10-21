//
//  LevelCollectionViewAdapter.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class LevelCollectionViewAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private weak var collectionView: UICollectionView?
    private var previouslyHaptedCell: Int = 0
    private var viewData: [LevelViewData] = []
    
    func setup(collectionView: UICollectionView, viewData: StageViewData) {
        self.viewData = viewData.levels
        self.collectionView = collectionView
        collectionView.register(cells: LevelCellProvider.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = viewData.color.primary
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LevelCellProvider.level.id, for: indexPath) as! LevelCollectionViewCell
        guard let level = viewData[safe: indexPath.item] else { return cell }
        cell.configure(with: level)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let width = height
        let size = CGSize(width: width, height: height)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { flowLayout.itemSize = size }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let spacing: CGFloat = 0
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { flowLayout.minimumLineSpacing = spacing }
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let spacing: CGFloat = 0
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { flowLayout.minimumInteritemSpacing = spacing }
        return spacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let firstIndexPath = IndexPath(item: 0, section: section)
        let size = self.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: firstIndexPath)
        let horizontalInset = (collectionView.bounds.size.width - size.width) / 2
        return UIEdgeInsets(top: 0,
                            left: horizontalInset,
                            bottom: 0,
                            right: horizontalInset)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let itemWidth = layout.itemSize.width
        let contentOffset = scrollView.contentOffset.x + (itemWidth/2)
        let itemIndex = Int(contentOffset / itemWidth)
        if previouslyHaptedCell != itemIndex {
            HapticFeedback.light()
            previouslyHaptedCell = itemIndex
        }
    }
}
