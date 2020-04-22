//
//  EventResultType.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation

enum EventResultType: Int {
    case empty
    case running
    case failed
    case complete
    case fork1
    case fork2
}

extension EventResultType {
    static let errorCompleteValue = -1

    var completeType: Int {
        let value = self.rawValue - EventResultType.complete.rawValue

        return max(value, EventResultType.errorCompleteValue)
    }
}
