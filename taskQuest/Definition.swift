//
//  Definition.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/14.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class Definition {
    static let dateFormat = "yyyy-MM-dd HH:mm"
    static let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = Definition.dateFormat
        return formatter
    }()
    static let emptyStartingTimeText = "開始日時なし"
}
