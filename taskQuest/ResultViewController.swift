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
    static let timerInterval: TimeInterval = 5

    @IBOutlet private var statusView: StatusView!
    @IBOutlet private var pauseOrResumeButton: ToggleButton!
    @IBOutlet private var skipOrCompleteButton: ToggleButton!
    @IBOutlet private var eventTableView: UITableView!

    private let realm = try! Realm()
    private let heroStatus = try! Realm().objects(Status.self).filter("id == \(Definition.heroId)").first!
    private var rootEventMasters = try! Realm().objects(RootEventMaster.self)

    private var timer: Timer?

    private var nowMaster: EventMasterProtocol!
    private var nowEvent: EventProtocol!

    // 仮
    private var remainingEvent = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self

        self.nowMaster = self.getRandomEventMaster(timing: .start)
        self.goNextEvent()
        self.pauseOrResumeButton.set(firstStateText: "一時停止", secondStateText: "再開")
        self.skipOrCompleteButton.set(firstStateText: "スキップ", secondStateText: "終了")

        self.timer = Timer.scheduledTimer(timeInterval: ResultViewController.timerInterval, target: self, selector: #selector(self.updateTimer(_:)), userInfo: nil, repeats: true)
    }

    @objc private func updateTimer(_ sender: Any) {
        self.update()
    }

    private func pauseTimer() {
        self.timer?.invalidate()
    }

    private func resumeTimer() {
        self.timer?.fire()
    }

    private func onCompleteOneEvent() {
        self.remainingEvent -= 1

        self.nowMaster = self.getRandomEventMaster(timing: self.remainingEvent <= 0 ? .end : .random)
    }

    private func goNextEvent() {
        self.nowEvent = self.nowMaster.create()
    }

    private func goNextEventMaster(completeType: Int) {
        let next = self.nowMaster.getNextMaster(completeType: completeType)

        if next == nil {
            self.onCompleteOneEvent()
        } else {
            self.nowMaster = next!
        }

        self.goNextEvent()
    }

    private func getRandomEventMaster(timing: EventTimingType) -> RootEventMaster {
        return self.rootEventMasters.filter("timingRow = \(timing.rawValue)").randomElement()!
    }

    private func initFromMaster() {
        self.nowEvent = self.nowMaster.create()
    }

    private func update() {
        let result = self.nowEvent.excute(playerStatus: self.heroStatus, table: self.eventTableView)

        switch result {
        case .running:
            return
        case .failed:
            /// @todo 専用の処理
            return

        default:
            // 残りは全て成功なはず
            let completeType = result.completeType
            if completeType < 0 {
                print("イベントの結果\(result)を成功として処理しようとしましたが、完了タイプが\(completeType)でした")
                return
            }

            self.goNextEventMaster(completeType: completeType)
            return
        }
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
