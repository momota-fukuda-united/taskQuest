//
//  ResultViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/17.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift
import UIKit

class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet private var statusView: StatusView!
    @IBOutlet private var pauseOrResumeButton: ToggleButton!
    @IBOutlet private var skipOrCompleteButton: ToggleButton!
    @IBOutlet private var eventTableView: UITableView!

    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self

        self.pauseOrResumeButton.set(firstStateText: "一時停止", secondStateText: "再開   ")
        self.skipOrCompleteButton.set(firstStateText: "スキップ", secondStateText: "終了")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)

        return cell
    }

    @IBAction func onTapPauseOrResumeButton(_ sender: ToggleButton) {
        if sender.toggle() {
        } else {}
    }

    @IBAction func onTapSkipOrCompleteButton(_ sender: ToggleButton) {
        if sender.toggle() {
        } else {}
    }
}
