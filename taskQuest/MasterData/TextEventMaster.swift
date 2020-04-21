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
    @objc private dynamic var id = 0

    private let nextId = RealmOptional<Int>()
    private let nextTypeRow = RealmOptional<Int>()

    private let textList = List<String>()
    private let imageNameList = List<String?>()

    override class func primaryKey() -> String? {
        return "id"
    }

    var nextType: EventType? {
        return self.nextTypeRow.value != nil ? EventType(rawValue: self.nextTypeRow.value!) : nil
    }

    convenience init(id: Int, next: (id: Int, type: EventType)?, eventList: [(imageName: String?, text: String)]) {
        self.init()

        self.id = id
        self.nextId.value = next?.id
        self.nextTypeRow.value = next?.type.rawValue

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

    func create() -> EventProtocol {
        return TextEvent(textList: self.textList, imageNameList: self.imageNameList)
    }

    func getNextMaster(result: Int) -> EventMasterProtocol? {
        return self.nextId.value != nil ? EventMasterUtil.getEventMaster(type: self.nextType!, id: self.nextId.value!) : nil
    }

    static let master: [TextEventMaster] = [
        TextEventMaster(id: 0, next: nil, eventList: [
            (nil, "冒険開始！"),
            (Definition.heroNormaiFaceImageName, "今日も頑張るぞ！"),
            (Definition.heroNormaiFaceImageName, "何が起こるか楽しみだ！"),
        ]),
        TextEventMaster(id: 1, next: nil, eventList: [
            (Definition.heroNormaiFaceImageName, "今日も疲れたけけど、頑張ったな！"),
            (Definition.heroNormaiFaceImageName, "ゆっくり休もう"),
            (nil, "冒険終了！")
        ]),
        TextEventMaster(id: 1000, next: nil, eventList: [
            (Definition.heroNormaiFaceImageName, "風が気持ちいい...")
        ]),
        TextEventMaster(id: 1001, next: nil, eventList: [
            (Definition.heroNormaiFaceImageName, "何かないかな？")
        ]),
    ]
}
