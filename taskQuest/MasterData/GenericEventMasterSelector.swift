//
//  GenericEventMasterSelector.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import RealmSwift

class GenericEventSelector<T: Object & EventMasterProtocol>: EventSelectorProtocol {
    private var masters = try! Realm().objects(T.self)

    func select(id: Int) -> EventMasterProtocol {
        return self.masters.filter("id == \(id)").first!
    }
}
