//
//  BoardView.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class BoardView: UIView {
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
    
    lazy var bottomBar: UIStackView = {
        let view = UIStackView(autoLayout: true)
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel(autoLayout: true)
        label.text = ""
        return label
    }()
    
    lazy var hintButton: UIButton = {
        let button = UIButton(autoLayout: true)
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        let image = UIImage(named: "hint")
        button.setImage(image, for: .normal)
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
        bottomBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Margin.wide).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func prepareBottomBar() {
        let firstView = UIView()
        let secondView = UIView()
        let thirdView = UIView()
        let fourthView = UIView()
        
        fourthView.addSubview(hintButton)
        hintButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        hintButton.widthAnchor.constraint(equalTo: hintButton.heightAnchor).isActive = true
        hintButton.centerYAnchor.constraint(equalTo: fourthView.centerYAnchor).isActive = true
        hintButton.centerXAnchor.constraint(equalTo: fourthView.centerXAnchor).isActive = true
        hintButton.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: fourthView.leadingAnchor, multiplier: 1.0).isActive = true
        hintButton.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: fourthView.trailingAnchor, multiplier: 1.0).isActive = true
        hintButton.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: fourthView.topAnchor, multiplier: 1.0).isActive = true
        hintButton.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: fourthView.bottomAnchor, multiplier: 1.0).isActive = true

        bottomBar.addArrangedSubview(firstView)
        bottomBar.addArrangedSubview(secondView)
        bottomBar.addArrangedSubview(thirdView)
        bottomBar.addArrangedSubview(fourthView)
    }
    
    private func prepareTopBar() {
        let firstView = UIView()
        let secondView = UIView()
        let thirdView = UIView()
        let fourthView = UIView()
        
        fourthView.addSubview(scoreLabel)
        scoreLabel.heightAnchor.constraint(equalToConstant: 64).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: fourthView.centerYAnchor).isActive = true
        scoreLabel.centerXAnchor.constraint(equalTo: fourthView.centerXAnchor).isActive = true
        scoreLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: fourthView.leadingAnchor, multiplier: 1.0).isActive = true
        scoreLabel.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: fourthView.trailingAnchor, multiplier: 1.0).isActive = true
        scoreLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: fourthView.topAnchor, multiplier: 1.0).isActive = true
        scoreLabel.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: fourthView.bottomAnchor, multiplier: 1.0).isActive = true

        topBar.addArrangedSubview(firstView)
        topBar.addArrangedSubview(secondView)
        topBar.addArrangedSubview(thirdView)
        topBar.addArrangedSubview(fourthView)
    }
}
