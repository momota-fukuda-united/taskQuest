//
//  UIUtil.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

extension UITableView {
    func apend<T: UITableViewCell>(id: String, section: Int = 0) -> T {
        self.beginUpdates()

        self.register(T.self, forCellReuseIdentifier: id)
        let newRow = self.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: newRow, section: section)
        self.insertRows(at: [indexPath], with: .automatic)
        let cell = self.dequeueReusableCell(withIdentifier: id, for: indexPath) as! T

        self.endUpdates()

        return cell
    }
}
