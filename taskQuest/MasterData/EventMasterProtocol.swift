//
//  EventMasterProtocol.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation

protocol EventMasterProtocol {
    func create() -> EventProtocol

    func getNextMasterId(result: Int) -> Int?
}
