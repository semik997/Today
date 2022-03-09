//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Семен Колесников on 09.03.2022.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
