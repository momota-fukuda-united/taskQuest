//
//  EventPtorocol.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

typealias EventInfo = (imageName: String?, text: String)
typealias EventResultData = (result: EventResultType, infos: [EventInfo])

protocol EventProtocol {
    func excute(playerStatus: StatusData) -> EventResultData
    
    func onComplete(playerStatus: StatusData)
}
