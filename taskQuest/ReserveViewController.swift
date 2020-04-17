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
    var reserveDelegate: ReserveDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if self.task.startingTime != nil {
            self.startingTimePicker.date = self.task.startingTime!
        }
        
        // 過去の時間を予約できないように
        self.startingTimePicker.minimumDate = Date()
    }
    
    func set(task: Task, reserveDelegate: ReserveDelegate?) {
        self.task = task
        self.reserveDelegate = reserveDelegate
    }
    
    func reserve(){
        try! self.realm.write {
            self.task.startingTime = self.startingTimePicker.date
            self.realm.add(self.task, update: .modified)
        }
    }
    
    @IBAction private func onTapReserveButton(_ sender: UIButton) {
        if self.startingTimePicker.date < Date(){
            let dialog = UIAlertController(title: "エラー", message: "未来の日時を指定してください", preferredStyle: .alert)
            dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(dialog, animated: true, completion: nil)
            return
        }
        
        self.reserveDelegate?.reserve(date: self.startingTimePicker.date) ?? self.reserve()
        
        self.navigationController?.popToViewController(ofClass: TopViewController.self)
    }
}
