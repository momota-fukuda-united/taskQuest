//
//  UIUtil.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

extension UIView {
    var className: String {
        return String(describing: type(of: self))
    }
}

extension UITableView {
    func apend(cellClass: AnyClass, id: String, section: Int = 0) {
        self.beginUpdates()

        self.register(cellClass, forCellReuseIdentifier: id)
        let newRow = self.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: newRow, section: section)
        self.insertRows(at: [indexPath], with: .automatic)

        self.endUpdates()
    }
}
