//
//  OnEndTaskViewController.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/16.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class OnEndTaskViewController: UIViewController {
    var task: Task!
    var time: TimeInterval = 0
    
    var isComplete: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toView = segue.destination
        
        if let reserveView = toView as? ReserveViewController {
            reserveView.set(task: self.task, reserveDelegate: nil)
        }
    }

    func set(task: Task, time: TimeInterval) {
        self.task = task
        self.time = time
    }

    private func showResult(isComplete: Bool, _ sender: Any) {
        self.isComplete = isComplete
        self.performSegue(withIdentifier: "showResult", sender: sender)
    }

    @IBAction private func onTapCompleteButton(_ sender: UIButton) {
        self.showResult(isComplete: true, sender)
    }

    @IBAction private func onTapIncompleteButton(_ sender: UIButton) {
        self.showResult(isComplete: false, sender)
    }

    @IBAction private func onTapAbortButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
