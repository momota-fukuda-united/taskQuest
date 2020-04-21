//
//  EventSelectorProtocol.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation

protocol EventSelectorProtocol {
    func select(id: Int) -> EventMasterProtocol
}
