//
//  BoardViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class BoardViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var boardView: BoardView!
    var collectionView: UICollectionView {
        return boardView.collectionView
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    let viewModel: BoardViewModel
    let collectionAdapter: BoardCollectionViewAdapter = BoardCollectionViewAdapter()
    
    // MARK: - Lifecycle
    
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
        bind()
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        self.collectionAdapter.setup(collectionView: boardView.collectionView, viewModel: viewModel)
    }
    
    private func bind() {
        viewModel.transform(input: .init(click: collectionView.rx.itemSelected.asSignal()))
        viewModel.output.reload
            .drive(onNext: { [weak self] (indexPaths) in
                guard let self = self else { return }
                indexPaths.forEach {
                    let cell = self.collectionView.cellForItem(at: $0) as? BoardCollectionViewCell
                    let viewData = self.viewModel.output.viewData[$0.section][$0.item]
                    cell?.refresh(with: viewData)
                }
            })
            .disposed(by: disposeBag)
    }
}
