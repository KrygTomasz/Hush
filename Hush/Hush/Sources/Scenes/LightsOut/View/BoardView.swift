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
    
    lazy var bottomBar: UIStackView = {
        let view = UIStackView(autoLayout: true)
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
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
        addSubview(bottomBar)
        prepareBottomBar()
        
        bottomBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Margin.wide).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func prepareBottomBar() {
        let firstBottomView = UIView()
        let secondBottomView = UIView()
        let thirdBottomView = UIView()
        let fourthBottomView = UIView()
        
        fourthBottomView.addSubview(hintButton)
        hintButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        hintButton.widthAnchor.constraint(equalTo: hintButton.heightAnchor).isActive = true
        hintButton.centerYAnchor.constraint(equalTo: fourthBottomView.centerYAnchor).isActive = true
        hintButton.centerXAnchor.constraint(equalTo: fourthBottomView.centerXAnchor).isActive = true
        hintButton.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: fourthBottomView.leadingAnchor, multiplier: 1.0).isActive = true
        hintButton.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: fourthBottomView.trailingAnchor, multiplier: 1.0).isActive = true
        hintButton.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: fourthBottomView.topAnchor, multiplier: 1.0).isActive = true
        hintButton.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: fourthBottomView.bottomAnchor, multiplier: 1.0).isActive = true

        bottomBar.addArrangedSubview(firstBottomView)
        bottomBar.addArrangedSubview(secondBottomView)
        bottomBar.addArrangedSubview(thirdBottomView)
        bottomBar.addArrangedSubview(fourthBottomView)
    }
}
