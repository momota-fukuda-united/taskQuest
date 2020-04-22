//
//  ChangeStatusEvent.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/22.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import RealmSwift

class ChangeStatusEvent: EventProtocol {
    private let maxHp: Int
    private let hp: Int
    private let maxAp: Int
    private let ap: Int
    private let atk: Int
    private let def: Int
    private let int: Int
    private let luk: Int
    private let gold: Int

    init(maxHp: Int, hp: Int, maxAp: Int, ap: Int, atk: Int, def: Int, int: Int, luk: Int, gold: Int) {
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

    func excute(playerStatus: Status) -> EventResultData {
        var infos: [EventInfo] = []

        EventUtil.setToUpDownInfo(paramName: Def.maxHpName, value: self.maxHp, infos: &infos)
        EventUtil.setToUpDownInfo(paramName: Def.maxApName, value: self.maxAp, infos: &infos)
        EventUtil.setToUpDownInfo(paramName: Def.atkName, value: self.atk, infos: &infos)
        EventUtil.setToUpDownInfo(paramName: Def.defName, value: self.def, infos: &infos)
        EventUtil.setToUpDownInfo(paramName: Def.intName, value: self.int, infos: &infos)
        EventUtil.setToUpDownInfo(paramName: Def.lukName, value: self.luk, infos: &infos)
        EventUtil.setToDamgeInfo(value: -self.hp, attackToEnemy: false, infos: &infos)
        EventUtil.setToUpDownInfo(paramName: Def.apName, value: self.atk, infos: &infos)
        EventUtil.setToGetMoneyInfo(value: self.gold, infos: &infos)
        playerStatus.change(maxHp: self.maxHp, hp: self.hp, maxAp: self.maxAp, ap: self.ap, atk: self.atk, def: self.def, int: self.int, luk: self.luk, gold: self.gold)

        return (.complete, infos)
    }

    func onComplete(playerStatus: Status) {}
}
