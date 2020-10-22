//
//  BoardView.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class BoardView: UIView {
    private enum Constants {
        static let imageSize: CGFloat = 64
        static let fontSize: CGFloat = 56
    }
    
    lazy var layout: UICollectionViewLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var topBar: UIStackView = {
        let view = UIStackView(autoLayout: true)
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var bottomBar: BottomBarView = {
        return BottomBarView(autoLayout: true)
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel(autoLayout: true)
        label.text = ""
        label.textAlignment = .center
        label.bold(.large)
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = createButton(imageName: "back")
        return button
    }()
    
    lazy var hintButton: UIButton = {
        let button = createButton(imageName: "question")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    private func commonSetup() {
        backgroundColor = .clear
        addSubview(topBar)
        addSubview(bottomBar)
        
        prepareTopBar()
        prepareBottomBar()
        
        topBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        bottomBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func prepareBottomBar() {
        bottomBar.setButtons(first: backButton, fourth: hintButton)
    }
    
    private func prepareTopBar() {
        let firstView = UIView()
        let secondView = UIView()
        let thirdView = UIView()
        
        thirdView.addCentered(view: scoreLabel)

        topBar.addArrangedSubview(firstView)
        topBar.addArrangedSubview(secondView)
        topBar.addArrangedSubview(thirdView)
    }
    
    private func createButton(imageName: String) -> UIButton {
        let button = UIButton(autoLayout: true)
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: Constants.imageSize))
        let image = UIImage(named: imageName, in: nil, with: configuration)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addScaledTap()
        return button
    }
    
    func colorIcons(_ color: UIColor) {
        scoreLabel.textColor = color
        hintButton.tintColor = color
        backButton.tintColor = color
    }
}
