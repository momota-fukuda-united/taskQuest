//
//  TaskDetailViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/14.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift
import UIKit

class TaskDetailViewController: UIViewController, ReserveDelegate {

    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination
        if let reserveView = toViewController as? ReserveViewController {
            reserveView.set(task: self.task!, reserveDelegate: self)
            return
        }
        if let doingView = toViewController as? DoingViewController {
            doingView.set(task: self.task!)
            return
        }
    }
    
    func reserve(date: Date) {
        self.apply(date: date)
    }
    
    private func apply(date: Date?){
        
        let task = self.task!
        try! self.realm.write {
            task.title = self.titleTextField.text!
            task.type = TaskType.allCases[self.typeSegmentedControl.selectedSegmentIndex]
            task.memo = self.memoTextView.text
            task.timer = self.timerPicker.countDownDuration
            task.startingTime = date
            
            self.realm.add(task, update: .modified)
        }
    }
    
    func showNeedsTitleDialog(){
        let dialog = UIAlertController(title: "エラー", message: "タイトルは必須です", preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(dialog, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    @IBAction func onTapDoNowButton(_ sender: UIButton) {
        if self.titleTextField.text == "" {
            self.showNeedsTitleDialog()
            return
        }
        
        self.apply(date: nil)
        self.performSegue(withIdentifier: "showDoing", sender: sender)
    }
    
    @IBAction func onTapReserveButton(_ sender: UIButton) {
        if self.titleTextField.text == "" {
            self.showNeedsTitleDialog()
            return
        }
        
        self.performSegue(withIdentifier: "showReserve", sender: sender)
    }
    
    @IBAction func onTapDeleteButton(_ sender: UIButton) {
        if self.task == nil {
            return
        }
        
        try! self.realm.write {
            self.realm.delete(self.task!)
        }
        
        self.task = nil
        self.performSegue(withIdentifier: "unwindTop", sender: sender)
    }
}
