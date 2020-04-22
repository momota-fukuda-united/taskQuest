//
//  ViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/13.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet private var statusView: StatusView!
    @IBOutlet private var taskTable: UITableView!
    
    private let realm = try! Realm()
    var tasks = try! Realm().objects(Task.self)
        .sorted(byKeyPath: "startingTime", ascending: true)
        .sorted(byKeyPath: "isCompleted", ascending: true)
    var status = try! Realm().objects(StatusData.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.taskTable.delegate = self
        self.taskTable.dataSource = self
        
        let status = self.status.filter("id == \(Def.heroId)").first!
        self.statusView.set(status: status.create())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.taskTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination
        
        if let taskDetailView = toViewController as? TaskDetailViewController {
            if segue.identifier == "selectCell" {
                let selected = self.taskTable.indexPathForSelectedRow!
                taskDetailView.task = self.tasks[selected.row]
                return
            }
        }
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            try! self.realm.write {
                self.realm.delete(self.tasks[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            break
        }
    }
}
