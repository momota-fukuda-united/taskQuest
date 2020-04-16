//
//  Task.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/14.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift

class Task: Object {
    // ID(プライマリキー)
    @objc dynamic var id = 0
    
    @objc dynamic var title = ""
    
    @objc private dynamic var typeRow = TaskType.other.rawValue
    
    @objc dynamic var memo = ""
    
    @objc dynamic var timer = TimeInterval()
    
    @objc dynamic var startingTime: Date?
    
    @objc dynamic var isComplete = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    var type: TaskType {
        get {
            return TaskType(rawValue: self.typeRow)!
        }
        set {
            self.typeRow = newValue.rawValue
        }
    }
    
    static func Create(realm: Realm) -> Task{
        let task = Task()
        let allTasks = realm.objects(Task.self)
        if allTasks.count > 0 {
            task.id = allTasks.max(ofProperty: "id")! + 1
        }
        
        return task
    }
}
