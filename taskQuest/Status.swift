//
//  Status.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/22.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation

class Status {
    var maxHp: Int
    var hp: Int
    var maxAp: Int
    var ap: Int
    var atk: Int
    var def: Int
    var int: Int
    var luk: Int
    var gold: Int

    init(id: Int, maxHp: Int, maxAp: Int, atk: Int, def: Int, int: Int, luk: Int, gold: Int) {
        self.maxHp = maxHp
        self.hp = self.maxHp
        self.maxAp = maxAp
        self.ap = self.maxAp
        self.atk = atk
        self.def = def
        self.int = int
        self.luk = luk
        self.gold = gold
    }

    func change(maxHp: Int = 0, hp: Int = 0, maxAp: Int = 0, ap: Int = 0, atk: Int = 0, def: Int = 0, int: Int = 0, luk: Int = 0, gold: Int = 0) {
        self.maxHp = max(1, self.maxHp + maxHp)
        self.hp = max(0, min(self.maxHp, self.hp + hp))
        self.maxAp = max(1, self.maxAp + maxAp)
        self.ap = max(0, min(self.maxAp, self.ap + ap))
        self.atk = max(1, self.atk + atk)
        self.def = max(1, self.def + def)
        self.int = max(1, self.int + int)
        self.luk = max(1, self.luk + luk)
        self.gold = max(0, self.gold + gold)
    }
}
