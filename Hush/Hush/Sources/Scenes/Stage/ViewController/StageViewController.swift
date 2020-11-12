//
//  StageViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class StageViewController: UIViewController {
    
    private enum Constants {
        static let imageSize: CGFloat = 64.0
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomBarView: BottomBarView!
    
    let viewModel: StageViewModel
    let tableAdapter: StageTableViewAdapter = StageTableViewAdapter()

    // MARK: - Lifecycle
    
    init(viewModel: StageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: StageViewController.self), bundle: Bundle(for: StageViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGradientBackground(with: .init(colors: [viewModel.output.color.dynamicTertiary, viewModel.output.color.primary]))
        setupTableView()
        setupBottomBar()
    }
    
    private func setupTableView() {
        tableAdapter.setup(tableView: tableView, viewModel: viewModel)
    }
    
    private func setupBottomBar() {
        setupBackButton()
        bottomBarView.addTopShadow()
    }
    
    private func setupBackButton() {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: Constants.imageSize))
        let image = UIImage(named: "back", in: nil, with: configuration)
        bottomBarView.set(color: viewModel.output.color, transparentBackground: false)
        bottomBarView.firstButton.setImage(image, for: .normal)
        bottomBarView.firstButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc private func goBack() {
        viewModel.input.backTrigger.accept(())
    }

}
