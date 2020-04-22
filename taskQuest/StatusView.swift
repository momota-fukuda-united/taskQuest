//
//  StatusView.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/13.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import Foundation
import UIKit

class StatusView: UIView {
    static let firstStatusLabelFormat = "HP %d/%d"
    static let secondStatusLabelFormat = "ATK %d DEF %d INT %d LUK %d"
    static let thirdStatusLabelFormat = "%d Gold"
    
    @IBOutlet private var firstStatusLabel: UILabel!
    @IBOutlet private var secondStatusLabel: UILabel!
    @IBOutlet private var thirdStatusLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.loadNib()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
         // Drawing code
     }
     */
    
    func set(status: Status) {
        self.firstStatusLabel.text = String(format: StatusView.firstStatusLabelFormat, status.hp, status.maxHp)
        self.secondStatusLabel.text = String(format: StatusView.secondStatusLabelFormat, status.atk, status.def, status.int, status.luk)
        self.thirdStatusLabel.text = String(format: StatusView.thirdStatusLabelFormat, status.gold)
    }
    
    private func loadNib() {
        let nib = UINib(nibName: self.className, bundle: Bundle.main)
        let statusView = nib.instantiate(withOwner: self, options: nil).first! as! UIView
        statusView.frame = self.bounds
        self.addSubview(statusView)
    }
}
