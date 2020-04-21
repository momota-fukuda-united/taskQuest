//
//  EventMaster.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/20.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift

class RootEventMaster: Object, EventMasterProtocol {
    @objc private dynamic var id = 0

    @objc private dynamic var bodyEventId = 0
    @objc private dynamic var typeRow = EventType.text.rawValue

    var type: EventType {
        get {
            return EventType(rawValue: self.typeRow)!
        }
        set {
            self.typeRow = newValue.rawValue
        }
    }

    override class func primaryKey() -> String? {
        return "id"
    }

    convenience init(id: Int, bodyEventId: Int, type: EventType) {
        self.init()

        self.id = id
        self.bodyEventId = bodyEventId
        self.type = type
    }

    func create() -> EventProtocol {
        return EmptyEvent()
    }

    func getNextMaster(result: Int) -> EventMasterProtocol? {
        return EventMasterUtil.getEventMaster(type: self.type, id: self.bodyEventId)
    }

    static let master: [RootEventMaster] = [
        RootEventMaster(id: 0, bodyEventId: 0, type: .text),
        RootEventMaster(id: 1, bodyEventId: 1, type: .text),
        RootEventMaster(id: 2, bodyEventId: 1000, type: .text),
        RootEventMaster(id: 3, bodyEventId: 1001, type: .text),
    ]
}
