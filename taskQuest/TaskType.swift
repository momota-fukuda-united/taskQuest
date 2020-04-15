//
//  TaskType.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/14.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

// 必ず新しい項目はother前に追加
enum TaskType: Int, CaseIterable {
    case study
    case exercise
    case work
    case housework

    case other = 1000
}

extension TaskType {
    private static let textDic: [TaskType: String] = [
        .study: "勉強",
        .exercise: "運動",
        .work: "仕事",
        .housework: "家事",

        .other: "その他",
    ]

    var text: String {
        return TaskType.textDic[self]!
    }

    var index: Int {
        return TaskType.allCases.firstIndex(of: self)!
    }
}
