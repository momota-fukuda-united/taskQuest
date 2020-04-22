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

class TextEventInitHelper {
    let imageName: String?
    let text: String
    let changeStatusEvent: ChangeStatusEventMaster?

    init(imageName: String? = nil, text: String, changeStatusEvent: ChangeStatusEventMaster? = nil) {
        self.imageName = imageName
        self.text = text
        self.changeStatusEvent = changeStatusEvent
    }
}

class TextEventMaster: Object, EventMasterProtocol {
    @objc private dynamic var id = 0

    @objc private dynamic var consumedAp = 0

    private let nextId = RealmOptional<Int>()
    private let nextTypeRow = RealmOptional<Int>()

    private let textList = List<String>()
    private let imageNameList = List<String?>()
    private let changeStatusEventList = List<ChangeStatusEventMaster?>()

    override class func primaryKey() -> String? {
        return "id"
    }

    var nextType: EventType? {
        return self.nextTypeRow.value != nil ? EventType(rawValue: self.nextTypeRow.value!) : nil
    }

    convenience init(id: Int, consumedAp: Int = 1, next: (id: Int, type: EventType)? = nil, eventList: [TextEventInitHelper]) {
        self.init()

        self.id = id
        self.consumedAp = consumedAp
        self.nextId.value = next?.id
        self.nextTypeRow.value = next?.type.rawValue

        for helper in eventList {
            self.imageNameList.append(helper.imageName)
            self.textList.append(helper.text)
            self.changeStatusEventList.append(helper.changeStatusEvent)
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

    func create() -> EventProtocol {
        return TextEvent(consumedAp: self.consumedAp, textList: self.textList, imageNameList: self.imageNameList, changeStatusEventList: self.changeStatusEventList)
    }

    func getNextMaster(completeType: Int) -> EventMasterProtocol? {
        return self.nextId.value != nil ? EventMasterUtil.getEventMaster(type: self.nextType!, id: self.nextId.value!) : nil
    }

    static let master: [TextEventMaster] = [
        TextEventMaster(id: 0, consumedAp: 0,  eventList: [
            TextEventInitHelper(text: "冒険開始！"),
            TextEventInitHelper(imageName: Def.heroNormaiFaceImageName, text: "今日も頑張るぞ！"),
            TextEventInitHelper(imageName: Def.heroNormaiFaceImageName, text: "何が起こるか楽しみだ！")
        ]),
        TextEventMaster(id: 1, consumedAp: 0,  eventList: [
            TextEventInitHelper(imageName: Def.heroNormaiFaceImageName, text: "今日も疲れたけけど、頑張ったな！"),
            TextEventInitHelper(imageName: Def.heroNormaiFaceImageName, text: "ゆっくり休もう"),
            TextEventInitHelper(text: "冒険終了！")
        ]),
        TextEventMaster(id: 1000,  eventList: [
            TextEventInitHelper(imageName: Def.heroNormaiFaceImageName, text: "風が気持ちいい...")
        ]),
        TextEventMaster(id: 1001, eventList: [
            TextEventInitHelper(imageName: Def.heroNormaiFaceImageName, text: "何かないかな？")
        ]),
        TextEventMaster(id: 1002, eventList: [
            TextEventInitHelper(imageName: Def.heroNormaiFaceImageName, text: "いてっ！"),
            TextEventInitHelper( text: "石につまずいた...", changeStatusEvent: ChangeStatusEventMaster(hp: -1)),
        ]),
    ]
}
