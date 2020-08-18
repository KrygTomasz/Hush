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
        let lightTrigger = collectionView.rx.itemSelected.asSignal().do(onNext: { _ in
            HapticFeedback.launch()
        })
        let hintTrigger = boardView.hintButton.rx.tap.asSignal().map { _ in return Void() }
        
        viewModel.transform(input: .init(lightTrigger: lightTrigger, hintTrigger: hintTrigger))
        viewModel.output.reload
            .drive(onNext: { [weak self] (indexPaths) in
                guard let self = self else { return }
                indexPaths.forEach {
                    let cell = self.collectionView.cellForItem(at: $0) as? BoardCollectionViewCell
                    let viewData = self.viewModel.output.viewData[$0.section][$0.item]
                    cell?.unhinted()
                    cell?.refresh(with: viewData)
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.output.hint
            .drive(onNext: { (indexPath) in
                let cell = self.collectionView.cellForItem(at: indexPath) as? BoardCollectionViewCell
                cell?.hinted()
            })
            .disposed(by: disposeBag)
        
        viewModel.output.score
            .drive(onNext: { [weak self] (score) in
                self?.boardView.scoreLabel.text = score.display()
            })
            .disposed(by: disposeBag)
        
        viewModel.output.gameOver
            .drive(onNext: { [weak self] (_) in
                self?.boardView.scoreLabel.text = "Winner"
            })
            .disposed(by: disposeBag)
        
        viewModel.output.color
            .drive(onNext: { [weak self] (color) in
                self?.view.backgroundColor = color.primary
                self?.boardView.scoreLabel.textColor = color.secondary
                self?.boardView.hintButton.tintColor = color.secondary
            })
            .disposed(by: disposeBag)
    }
}
