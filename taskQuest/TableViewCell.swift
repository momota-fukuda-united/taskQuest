//
//  TableViewCell.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/14.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(title: String, type: TaskType, startingTime: Date?) {
        self.textLabel?.text = title

        let detailText = startingTime != nil ?
            Definition.dateFormatter.string(from: startingTime!) :
            Definition.emptyStartingTimeText

        self.detailTextLabel?.text = detailText
    }
}