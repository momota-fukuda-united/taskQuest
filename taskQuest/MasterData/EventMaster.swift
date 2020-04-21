//
//  EventMaster.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/20.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift

class RootEventMaster : Object, EventMasterProtocol {

    @objc dynamic var id = 0

    @objc dynamic var type = EventType.text.rawValue

    override class func primaryKey() -> String? {
        return "id"
    }

    func create() -> EventProtocol {
        return EmptyEvent()
    }
    
    func getNextMaster(result: Int) {
        
    }
}
