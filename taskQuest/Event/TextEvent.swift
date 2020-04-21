//
//  TextEvent.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import RealmSwift

class TextEvent: EventProtocol {
    let textList: List<String>
    let imageNameList: List<String?>
    
    var index = 0
    
    init(textList: List<String>, imageNameList: List<String?>) {
        self.textList = textList
        self.imageNameList = imageNameList
    }
    
    func excute(playerStatus: Status, table: UITableView) -> EventResultType {
        let text = self.textList[self.index]
        let imageName = self.imageNameList[self.index]
        
        let image = UIImage(named: imageName ?? "")
        
        let cell: EventTableViewCell = table.apend(id: EventTableViewCell.cellId)
        
        cell.set(icon: image, text: text)
        
        self.index += 1
        return self.index < self.textList.count ? .running : .complete
    }
}
