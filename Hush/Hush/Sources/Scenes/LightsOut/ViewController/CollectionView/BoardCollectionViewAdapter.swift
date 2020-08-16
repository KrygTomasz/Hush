//
//  BoardCollectionViewAdapter.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class BoardCollectionViewAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var collectionView: UICollectionView!
    weak var viewModel: BoardViewModel!
    
    init(collectionView: UICollectionView, viewModel: BoardViewModel) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        collectionView.register(cells: BoardCellProvider.self)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4//viewModel.output.sectionsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4//viewModel.output.rowsCount(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCellProvider.light.id, for: indexPath) as! BoardCollectionViewCell
        cell.backgroundColor = Int.random(in: 0..<2) == 0 ? .yellow : .red
        //cell.configure(viewModel.output.viewData(for: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //viewModel.input.lightSelected(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = CGFloat(collectionView.numberOfSections)
        let size = CGSize(width: collectionView.bounds.width/width, height: collectionView.bounds.width/width)
        return size
    }
}
