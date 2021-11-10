//
//  ViewController.swift
//  Today
//
//  Created by MacBook on 09.11.2021.
//

import UIKit

class ReminderListViewController: UITableViewController {


}

extension ReminderListViewController {
    
    static let reminderListCellIndetifier = "ReminderListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIndetifier, for: indexPath) as? ReminderListCell else { fatalError("Unable to dequeue ReminderCell")}
        
        let reminder = Reminder.testData[indexPath.row]
        
        //Empty circle for incomplete reminders or a filled circle for complete reminders
        let image = reminder.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        
        cell.titleLabel.text = reminder.title
        cell.dateLabel.text = 
        
        return cell
    }

}

