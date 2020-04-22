//
//  EventUtil.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/22.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation

class EventUtil {
    static func setToUpDownInfo(paramName: String, value: Int, infos: inout [EventInfo]) {
        if value == 0 {
            return
        }

        let text = String(format: value > 0 ? Def.statusUpText : Def.statusDownText, paramName, value)
        infos.append((nil, text))
    }

    static func setToDamgeInfo(value: Int, attackToEnemy: Bool, infos: inout [EventInfo]) {
        if value == 0 {
            return
        }

        let damageText = attackToEnemy ? Def.addDamageText : Def.receiveDamageText
        let text = String(format: value > 0 ? damageText : Def.recoverText, value)
        infos.append((nil, text))
    }
    
    static func setToGetMoneyInfo(value: Int, infos: inout [EventInfo]) {
        if value == 0 {
            return
        }

        let text = String(format: value > 0 ? Def.getMoneyText : Def.loseMoneyText, value)
        infos.append((nil, text))
    }
}
