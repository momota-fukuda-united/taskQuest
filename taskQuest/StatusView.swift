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
    var className: String {
        return String(describing: type(of: self))
    }
    
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
    
    func loadNib() {        
        let nib = UINib(nibName: self.className, bundle: Bundle.main)
        let statusView = nib.instantiate(withOwner: self, options: nil).first! as! UIView
        statusView.frame = self.bounds
        self.addSubview(statusView)
    }
}
