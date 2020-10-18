//
//  AlertBuilder.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

class AlertBuilder {
    private var title: String?
    private var description: String?
    private var firstButtonData: AlertButtonData?
    private var secondButtonData: AlertButtonData?
    private var color: Color?
    
    func set(title value: String) -> AlertBuilder {
        self.title = value
        return self
    }
    
    func set(description value: String) -> AlertBuilder {
        self.description = value
        return self
    }
    
    func set(firstButton value: AlertButtonData) -> AlertBuilder {
        self.firstButtonData = value
        return self
    }
    
    func set(secondButton value: AlertButtonData) -> AlertBuilder {
        self.secondButtonData = value
        return self
    }
    
    func set(color value: Color) -> AlertBuilder {
        self.color = value
        return self
    }
    
    func build() -> Alert {
        return Alert(title: title,
                     description: description,
                     firstButtonData: firstButtonData,
                     secondButtonData: secondButtonData,
                     color: color)
    }
}
