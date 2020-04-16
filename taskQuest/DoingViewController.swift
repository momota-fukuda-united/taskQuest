//
//  DoingViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/16.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class DoingViewController: UIViewController {
    static let timerInterval: TimeInterval = 60

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var memoTextView: UITextView!
    @IBOutlet private var timerLabel: UILabel!

    private var task: Task!
    private var remainingSec: TimeInterval = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let task = self.task!
        self.remainingSec = task.timer
        self.titleLabel.text = task.title
        self.memoTextView.text = task.memo
        self.timerLabel.text = DoingViewController.createTimeText(time: task.timer)

        Timer.scheduledTimer(timeInterval: DoingViewController.timerInterval, target: self, selector: #selector(self.updateTimer(timer:)), userInfo: nil, repeats: true)
        self.remainingSec = task.timer
        
        self.navigationItem.hidesBackButton = true
    }

    func set(task: Task) {
        self.task = task
    }

    private static func createTimeText(time: TimeInterval) -> String {
        let hour = Int(time / 3600.0)
        let minute = Int(time / 60.0) % 60

        return String(format: "%02d:%02d", hour, minute)
    }

    @objc func updateTimer(timer: Timer) {
        self.remainingSec -= DoingViewController.timerInterval
        if self.remainingSec <= 0 {
            timer.invalidate()
            self.timerLabel.textColor = .red
            
            self.remainingSec = 0
        }
        
        self.timerLabel.text = DoingViewController.createTimeText(time: self.remainingSec)
    }
}
