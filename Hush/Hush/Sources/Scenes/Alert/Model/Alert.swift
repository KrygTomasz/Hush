//
//  Alert.swift
//  Hush
//
//  Created by Tomasz Kryg on 18/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

typealias AlertButtonAction = (() -> Void)

struct AlertButtonData {
    var text: String
    var action: AlertButtonAction?
}

struct Alert {
    let title: String?
    let description: String?
    let firstButtonData: AlertButtonData?
    let secondButtonData: AlertButtonData?
    let color: Color
    
    init(title: String? = nil,
         description: String? = nil,
         firstButtonData: AlertButtonData? = nil,
         secondButtonData: AlertButtonData? = nil,
         color: Color? = nil) {
        self.title = title
        self.description = description
        self.firstButtonData = firstButtonData
        self.secondButtonData = secondButtonData
        self.color = color ?? .random
    }
}
