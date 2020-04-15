//
//  Status.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/15.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift

class Status: Object{
    @objc dynamic var id = 0
    
    @objc dynamic var maxHp = 0
    @objc dynamic var hp = 0
    @objc dynamic var atk = 0
    @objc dynamic var def = 0
    @objc dynamic var int = 0
    @objc dynamic var luk = 0
    @objc dynamic var gold = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
