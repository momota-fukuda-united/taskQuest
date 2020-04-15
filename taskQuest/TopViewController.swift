//
//  ViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/13.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import RealmSwift
import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet private var statusView: StatusView!
    @IBOutlet private var taskTable: UITableView!
    
    private let realm = try! Realm()
    var tasks = try! Realm().objects(Task.self)
        .sorted(by: { (arg1: Task, arg2: Task) -> Bool in
            if arg2.startingTime == nil {
                return true
            } else if arg1.startingTime == nil {
                return false
            }
            
            return arg1.startingTime! < arg2.startingTime!
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.taskTable.delegate = self
        self.taskTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskCell
        let task = self.tasks[indexPath.row]
        cell.set(title: task.title, type: task.type, startingTime: task.startingTime)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "selectCell", sender: nil)
    }
}
