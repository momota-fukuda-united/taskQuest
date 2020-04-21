//
//  EventType.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/20.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation

enum EventType: Int {
    case unknown = 0
    
    case root
    case text
    case check
    case fork
    case battle
}
