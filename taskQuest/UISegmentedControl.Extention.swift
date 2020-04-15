//
//  UISegmentedControl.Extention.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/15.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    func resetAllSegments(arr: [String]) {
        self.removeAllSegments()
        for text in arr {
            self.insertSegment(withTitle: text, at: self.numberOfSegments, animated: false)
        }
        self.selectedSegmentIndex = 0
    }
}
