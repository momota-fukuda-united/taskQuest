//
//  ReserveViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/15.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift
import UIKit

class ReserveViewController: UIViewController {
    @IBOutlet private var startingTimePicker: UIDatePicker!
    
    let realm = try! Realm()
    var task: Task!
    var reserveDelegate: ReserveDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if self.task.startingTime != nil {
            self.startingTimePicker.date = self.task.startingTime!
        }
    }
    
    func set(task: Task, reserveDelegate: ReserveDelegate) {
        self.task = task
        self.reserveDelegate = reserveDelegate
    }
    
    @IBAction private func onTapReserveButton(_ sender: UIButton) {
        self.reserveDelegate.reserve(date: self.startingTimePicker.date)
        
        self.navigationController?.popToViewController(ofClass: TopViewController.self)
    }
}
