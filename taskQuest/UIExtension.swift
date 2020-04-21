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
        let newRow = self.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: newRow, section: section)
        self.insertRows(at: [indexPath], with: .automatic)
        return self.dequeueReusableCell(withIdentifier: EventTableViewCell.cellId, for: indexPath) as! T
    }
}
