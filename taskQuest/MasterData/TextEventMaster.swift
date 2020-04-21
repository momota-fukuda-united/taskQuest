//
//  TextEventMaster.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class TextEventMaster: Object, EventMasterProtocol {

    
    @objc dynamic var id = 0
    let nextId = RealmOptional<Int>()
    let textList = List<String>()
    let imageNameList = List<String?>()

    convenience init(id: Int, nextId: Int?, eventList: [(imageName: String?, text: String)]) {
        self.init()

        self.id = id
        self.nextId.value = nextId

        for (imageName, text) in eventList {
            self.imageNameList.append(imageName)
            self.textList.append(text)
        }
    }

    required init() {
        super.init()
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }

    override class func primaryKey() -> String? {
        return "id"
    }
    
    func create() -> EventProtocol {
        return TextEvent()
    }
    
    func getNextMasterId(result: Int) -> Int? {
        return self.nextId.value
    }
}
