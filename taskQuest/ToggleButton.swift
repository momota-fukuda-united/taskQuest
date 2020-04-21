//
//  ToggleButton.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/17.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class ToggleButton: UIButton {
    private var isFirstState = true
    private var textDic: [Bool: String] = [true: "", false: ""]
    
    func set(firstStateText: String, secondStateText: String) {
        self.textDic[true] = firstStateText
        self.textDic[false] = secondStateText
        
        self.updateText()
    }
    
    func toggle() -> Bool {
        self.isFirstState = !self.isFirstState
        
        self.updateText()
        
        return self.isFirstState
    }
    
    private func updateText() {
        self.setTitle(self.textDic[self.isFirstState], for: .normal)
    }
}
