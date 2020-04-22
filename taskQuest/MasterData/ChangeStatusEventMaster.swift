//
//  ChangeStatusEventMaster.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/22.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// これ単体では実行されず、必ず他のイベントのexcute()からexcute()される想定
class ChangeStatusEventMaster: Object, EventMasterProtocol {
    @objc dynamic var maxHp = 0
    @objc dynamic var hp = 0
    @objc dynamic var maxAp = 0
    @objc dynamic var ap = 0
    @objc dynamic var atk = 0
    @objc dynamic var def = 0
    @objc dynamic var int = 0
    @objc dynamic var luk = 0
    @objc dynamic var gold = 0

    init(maxHp: Int = 0, hp: Int = 0, maxAp: Int = 0, ap: Int = 0, atk: Int = 0, def: Int = 0, int: Int = 0, luk: Int = 0, gold: Int = 0) {
        super.init()

        self.maxHp = maxHp
        self.hp = hp
        self.maxAp = maxAp
        self.ap = ap
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

    func create() -> EventProtocol {
        return ChangeStatusEvent(maxHp: self.maxHp, hp: self.hp, maxAp: self.maxAp, ap: self.ap, atk: self.atk, def: self.def, int: self.int, luk: self.luk, gold: self.gold)
    }

    func getNextMaster(completeType: Int) -> EventMasterProtocol? {
        return nil
    }
}
