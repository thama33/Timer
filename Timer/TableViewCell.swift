//
//  TableViewCell.swift
//  Timer
//
//  Created by 濱上卓也 on 2022/05/18.
//

import UIKit
import RealmSwift

class TableViewCell: UITableViewCell {

    @IBOutlet weak var kouteiLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sw: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTimeData(_ timers:Timers){
        self.kouteiLabel.text = ""
        
        self.timeLabel.text = ""
        
        self.sw.isOn = false
        
    }
}
