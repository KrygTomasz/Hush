//
//  BoardViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class BoardViewController: UIViewController {

    @IBOutlet weak var boardView: BoardView!
    
    let viewModel: BoardViewModel
    var collectionAdapter: BoardCollectionViewAdapter!
    
    init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: BoardViewController.self), bundle: Bundle(for: BoardViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.collectionAdapter = BoardCollectionViewAdapter(collectionView: boardView.collectionView, viewModel: viewModel)
        self.boardView.collectionView.delegate = collectionAdapter
        self.boardView.collectionView.dataSource = collectionAdapter
    }

}
