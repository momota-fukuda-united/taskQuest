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
    private let heroStatusData = try! Realm().objects(StatusData.self).filter("id == \(Def.heroId)").first!
    private var heroStatus: Status!
    private var rootEventMasters = try! Realm().objects(RootEventMaster.self)

    private var timer: Timer?

    private var nowMaster: EventMasterProtocol!
    private var nowEvent: EventProtocol!

    private var eventInfos: [EventInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.heroStatus = self.heroStatusData.create()
        
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self

        self.nowMaster = self.getRandomEventMaster(timing: .start)
        self.transitNextEvent()
        self.pauseOrResumeButton.set(firstStateText: "一時停止", secondStateText: "再開")
        self.skipOrCompleteButton.set(firstStateText: "スキップ", secondStateText: "終了")

        self.statusView.set(status: self.heroStatus)
        
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
        self.nowMaster = self.getRandomEventMaster(timing: self.heroStatus.ap <= 0 ? .end : .random)
    }

    private func transitNextEvent() {
        self.nowEvent = self.nowMaster.create()
    }

    private func transitNextEventMaster(completeType: Int) {
        self.nowEvent.onComplete(playerStatus: self.heroStatus)

        let next = self.nowMaster.getNextMaster(completeType: completeType)

        if next == nil {
            self.onCompleteOneEvent()
        } else {
            self.nowMaster = next!
        }

        self.transitNextEvent()
    }

    private func getRandomEventMaster(timing: EventTimingType) -> RootEventMaster {
        return self.rootEventMasters.filter("timingRow = \(timing.rawValue)").randomElement()!
    }

    private func initFromMaster() {
        self.nowEvent = self.nowMaster.create()
    }

    private func update() {
        let results = self.nowEvent.excute(playerStatus: self.heroStatus)
        let resultType = results.result
        let infos = results.infos

        for index in 0 ..< infos.count {
            self.eventInfos.append(infos[index])
            self.eventTableView.apend(cellClass: EventTableViewCell.self, id: EventTableViewCell.cellId)
        }

        self.statusView.set(status: self.heroStatus)
        
        switch resultType {
        case .running:
            return
        case .failed:
            /// @todo 専用の処理
            return
        case .empty:
            // 空イベントだったので次のイベントに進めてもう1度更新
            self.transitNextEventMaster(completeType: EventResultType.complete.rawValue)
            self.update()
            return

        default:
            // 残りは全て成功なはず
            let completeType = resultType.completeType
            if completeType < 0 {
                print("イベントの結果\(resultType)を成功として処理しようとしましたが、完了タイプが\(completeType)でした")
                return
            }

            self.transitNextEventMaster(completeType: completeType)
            return
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventInfos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        let info = self.eventInfos[indexPath.row]

        cell.set(icon: UIImage(named: info.imageName ?? ""), text: info.text)

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
