//
//  Item.swift
//  ymuraoKit
//
//  Created by 村尾慶伸 on 2023/12/02.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
