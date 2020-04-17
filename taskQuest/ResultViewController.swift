//
//  ResultViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/17.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet private weak var statusView: StatusView!
    @IBOutlet weak var pauseOrResumeButton: ToggleButton!
    @IBOutlet weak var skipOrCompleteButton: ToggleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pauseOrResumeButton.set(firstStateText: "一時停止", secondStateText: "再開   ")
        self.skipOrCompleteButton.set(firstStateText: "スキップ", secondStateText: "終了")
    }

}
