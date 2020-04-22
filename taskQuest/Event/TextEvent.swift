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
    private let realm = try! Realm()
    
    private let consumedAp: Int
    
    private let textList: List<String>
    private let imageNameList: List<String?>
    private let changeStatusEventList: List<ChangeStatusEventMaster>
    
    private var index = 0
    
    init(consumedAp: Int, textList: List<String>, imageNameList: List<String?>, changeStatusEventList: List<ChangeStatusEventMaster>) {
        self.consumedAp = consumedAp
        self.textList = textList
        self.imageNameList = imageNameList
        self.changeStatusEventList = changeStatusEventList
    }
    
    func excute(playerStatus: StatusData) -> EventResultData {
        let text = self.textList[self.index]
        let imageName = self.imageNameList[self.index]
        let changeStatusEvent = self.changeStatusEventList[self.index].create()
        
        self.index += 1
        let result: EventResultType = self.index < self.textList.count ? .running : .complete
        
        let changeStatusResults = changeStatusEvent.excute(playerStatus: playerStatus)
        
        var infos = [(imageName, text)]
        infos.append(contentsOf: changeStatusResults.infos)
        
        return (result, infos)
    }
    
    func onComplete(playerStatus: StatusData) {
        try! self.realm.write {
            playerStatus.ap -= self.consumedAp
        }
    }
}
