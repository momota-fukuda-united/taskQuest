//
//  EventMasterUtil.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation

class EventMasterUtil {
    static let selectorDic: [EventType: EventSelectorProtocol] = [
        .root: GenericEventSelector<RootEventMaster>(),
    ]

    static func getEventMaster(type: EventType, id: Int) -> EventMasterProtocol {
        return EventMasterUtil.selectorDic[type]!.select(id: id)
    }
}
