//
//  ViewController.swift
//  Today
//
//  Created by MacBook on 09.11.2021.
//

import UIKit

class ReminderListViewController: UITableViewController {
    
    static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Self.showDetailSegueIdentifier,
                   let destination = segue.destination as? ReminderDetailViewController,
                   let cell = sender as? UITableViewCell,
                   let indexPath = tableView.indexPath(for: cell) {
            
                    let reminder = Reminder.testData[indexPath.row]
                    destination.configure(with: reminder)
                }
        }


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
        // transfer date to date label
        cell.dateLabel.text = reminder.dueDate.description
        print(reminder.dueDate.description)
        
        // Update the Done button to display the appropriate completion status
        cell.doneButton.setBackgroundImage(image, for: .normal)
        cell.doneButtonAction = {
            // invoke toggle method
            Reminder.testData[indexPath.row].isComplete.toggle()
            // Reload the table rows for completed reminders
            tableView.reloadRows(at: [indexPath], with: .none)
            
        }
        
        return cell
    }

}

