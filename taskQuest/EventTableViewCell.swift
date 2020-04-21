//
//  EventTableViewCell.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var textView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(icon: UIImage?, text: String){
        self.textView.text = text
        
        // 画像がなければ非表示
        self.iconView.isHidden = icon == nil
        self.iconView.image = icon
    }
}
