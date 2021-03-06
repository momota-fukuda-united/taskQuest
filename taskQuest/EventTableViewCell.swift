//
//  EventTableViewCell.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/21.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    static let cellId = "eventCell"

    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var textView: UITextView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.loadNib()
    }

    private func loadNib() {
        let nib = UINib(nibName: self.className, bundle: Bundle.main)
        let cell = nib.instantiate(withOwner: self, options: nil).first! as! UIView
        cell.frame = self.bounds
        self.addSubview(cell)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(icon: UIImage?, text: String) {
        self.textView.text = text

        // 画像がなければ非表示
        self.iconView.isHidden = icon == nil
        self.iconView.image = icon
    }
}
