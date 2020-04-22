//
//  EmptyEvent.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class EmptyEvent: EventProtocol {
    func excute(playerStatus: Status) -> EventResultData {
        return (.complete, [])
    }
}
