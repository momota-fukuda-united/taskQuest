//
//  StatusMaster.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/17.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class StatusMaster: RealmSwift.Object {
    @objc dynamic var id = 0

    @objc dynamic var maxHp = 0
    @objc dynamic var maxAp = 0
    @objc dynamic var atk = 0
    @objc dynamic var def = 0
    @objc dynamic var int = 0
    @objc dynamic var luk = 0
    @objc dynamic var gold = 0

    override class func primaryKey() -> String? {
        return "id"
    }

    init(id: Int, maxHp: Int, maxAp: Int, atk: Int, def: Int, int: Int, luk: Int, gold: Int) {
        super.init()

        self.id = id
        self.maxHp = maxHp
        self.maxAp = maxAp
        self.atk = atk
        self.def = def
        self.int = int
        self.luk = luk
        self.gold = gold
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

    func createInitData() -> StatusData {
        return StatusData(id: self.id, maxHp: self.maxHp, maxAp: self.maxAp, atk: self.atk, def: self.def, int: self.int, luk: self.luk, gold: self.gold)
    }

    static let master: [StatusMaster] = [
        StatusMaster(id: 0, maxHp: 100, maxAp: 10, atk: 6, def: 6, int: 6, luk: 6, gold: 0)
    ]
}
