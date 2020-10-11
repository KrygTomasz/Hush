//
//  MenuViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    let viewModel: MenuViewModel
    var collectionAdapter: MenuCollectionViewAdapter!
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        viewModel.transform(input: .init())
        super.init(nibName: String(describing: MenuViewController.self), bundle: Bundle(for: MenuViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionAdapter = MenuCollectionViewAdapter(collectionView: collectionView, viewModel: viewModel)
        collectionView.delegate = collectionAdapter
        collectionView.dataSource = collectionAdapter
        collectionView.backgroundColor = viewModel.output.color.primary
    }
    
}
