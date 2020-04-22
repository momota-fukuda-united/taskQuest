//
//  Definition.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/14.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class Def {
    static let dateFormat = "yyyy-MM-dd HH:mm"
    static let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = Def.dateFormat
        return formatter
    }()
    static let emptyStartingTimeText = "開始日時なし"
    
    static let realmSchemaVersion: UInt64 = 1
    
    static let heroId = 0
    static let heroNormaiFaceImageName = "face_00_00"
    
    static let maxHpName = "MaxHP"
    static let hpName = "HP"
    static let maxApName = "MaxAP"
    static let apName = "AP"
    static let atkName = "ATK"
    static let defName = "DEF"
    static let intName = "INT"
    static let lukName = "LUK"
    static let moneyName = "Gold"
    
    static let statusUpText = "%@が%@上がった！"
    static let statusDownText = "%@が%@下がった..."
    static let receiveDamageText = "%@のダメージを受けた！"
    static let addDamageText = "%@のダメージを与えた！"
    static let recoverText = "%@回復した！"
    static let getMoneyText = "%@\(Def.moneyName)手に入れた！"
    static let loseMoneyText = "%@\(Def.moneyName)失った..."
}
