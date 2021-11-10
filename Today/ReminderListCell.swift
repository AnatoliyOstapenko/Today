//
//  ReminderListCell.swift
//  Today
//
//  Created by MacBook on 09.11.2021.
//

import UIKit

class ReminderListCell: UITableViewCell {
    
    
    typealias DoneButtonAction = () -> Void
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTriggered(_ sender: UIButton) {
            doneButtonAction?()
        }
    
    
    
}
