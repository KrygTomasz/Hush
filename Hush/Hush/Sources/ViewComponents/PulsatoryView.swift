//
//  PulsatoryView.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class PulsatoryView: UIView {
    
    private lazy var circle: Circle = {
        let view = Circle(frame: .zero)
        view.backgroundColor = UIColor.systemGreen
        return view
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        addSubview(circle)
        setupConstraints()
        startPulseAnimation()
    }
    
    private func setupConstraints() {
        circle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32.0).isActive = true
        circle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32.0).isActive = true
        circle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func startPulseAnimation() {
        circle.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.autoreverse, .repeat], animations: { [weak self] in
            self?.circle.transform = CGAffineTransform.identity
        }, completion: { _ in return })
    }
    
}
