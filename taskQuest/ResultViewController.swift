//
//  ResultViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/17.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {

    @IBOutlet private weak var statusView: StatusView!
    @IBOutlet private weak var pauseOrResumeButton: ToggleButton!
    @IBOutlet private weak var skipOrCompleteButton: ToggleButton!
    
      private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pauseOrResumeButton.set(firstStateText: "一時停止", secondStateText: "再開   ")
        self.skipOrCompleteButton.set(firstStateText: "スキップ", secondStateText: "終了")
    }

}
