//
//  AlertBuilder.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

class AlertBuilder {
    var title: String = ""
    var description: String = ""
    var image: String = ""
    
    func set(title value: String) -> AlertBuilder {
        self.title = value
        return self
    }
    
    func set(description value: String) -> AlertBuilder {
        self.description = value
        return self
    }
    
    func set(image value: String) -> AlertBuilder {
        self.image = value
        return self
    }
    
    func build() -> Alert {
        return Alert(title: title,
                     description: description)
    }
}
