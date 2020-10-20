//
//  BoardCollectionViewAdapter.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit
import RxCocoa

final class BoardCollectionViewAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    weak var viewModel: BoardViewModel!
    
    // MARK: - Setup
    
    func setup(collectionView: UICollectionView, viewModel: BoardViewModel) {
        self.viewModel = viewModel
        collectionView.register(cells: BoardCellProvider.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Delegates
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.output.sectionsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.output.rowsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCellProvider.light.id, for: indexPath) as! BoardCollectionViewCell
        let viewData = viewModel.output.viewData[indexPath.section][indexPath.item]
        cell.configure(with: viewData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = cellSize(for: collectionView)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets = calculateCenteringInsets(for: collectionView)
        let leftInset = insets.horizontal
        let rightInset = insets.horizontal
        var topInset: CGFloat = 0
        var bottomInset: CGFloat = 0
        if section == 0 {
            topInset = insets.vertical
        } else if section == viewModel.output.sectionsCount - 1 {
            bottomInset = insets.vertical
        }
        return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
    
    // MARK: - Helpers
    
    private func cellSize(for collectionView: UICollectionView) -> CGFloat {
        let items: CGFloat = CGFloat(viewModel.output.rowsCount)
        let sections: CGFloat = CGFloat(viewModel.output.sectionsCount)
        let width = collectionView.bounds.width/items
        let height = collectionView.bounds.height/sections
        return CGFloat.minimum(width, height)
    }
    
    private func calculateCenteringInsets(for collectionView: UICollectionView) -> (vertical: CGFloat, horizontal: CGFloat) {
        let allCellsWidth = cellSize(for: collectionView) * CGFloat(viewModel.output.rowsCount)
        let allCellsHeight = cellSize(for: collectionView) * CGFloat(viewModel.output.sectionsCount)
        let horizontalInset = (collectionView.bounds.width - CGFloat(allCellsWidth)) / 2
        let verticalInset = (collectionView.bounds.height - CGFloat(allCellsHeight)) / 2
        return (verticalInset, horizontalInset)
    }
}
