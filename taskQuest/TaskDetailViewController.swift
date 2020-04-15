//
//  TaskDetailViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/14.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift
import UIKit

class TaskDetailViewController: UIViewController {
    @IBOutlet private var titleTextField: UITextField!
    @IBOutlet private var typeSegmentedControl: UISegmentedControl!
    @IBOutlet private var memoTextView: UITextView!
    @IBOutlet private var timerPicker: UIDatePicker!
    @IBOutlet private var deleteButton: UIButton!
    
    let realm = try! Realm()
    var task: Task?
    var isCreatingMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.isCreatingMode = self.task == nil
        
        // 新規作成の場合は削除ボタンは非表示
        self.deleteButton.isHidden = self.isCreatingMode
        if self.task == nil {
            self.task = Task.Create(realm: self.realm)
        }
        
        self.typeSegmentedControl.resetAllSegments(arr: TaskType.allCases.map { $0.text })
        
        let task = self.task!
        
        self.titleTextField.text = task.title
        self.typeSegmentedControl.selectedSegmentIndex = task.type.index
        self.memoTextView.text = task.memo
        self.timerPicker.countDownDuration = task.timer
    }
    
    @objc func dismissKeyboard() {
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    @IBAction func onTapDoNowButton(_ sender: UIButton) {
        let task = self.task!
        try! self.realm.write {
            task.title = self.titleTextField.text!
            task.type = TaskType.allCases[self.typeSegmentedControl.selectedSegmentIndex]
            task.memo = self.memoTextView.text
            task.timer = self.timerPicker.countDownDuration
            
            self.realm.add(task, update: .modified)
        }
    }
    
    @IBAction func onTapDeleteButton(_ sender: UIButton) {
        if self.task == nil {
            return
        }
        
        try! self.realm.write {
            self.realm.delete(self.task!)
        }
        
        self.task = nil
        self.performSegue(withIdentifier: "unwindTop", sender: nil)
    }
}
