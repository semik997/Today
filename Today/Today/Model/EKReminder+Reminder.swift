//
//  EKReminder+Reminder.swift
//  Today
//
//  Created by Sem Koliesnikov on 15.03.2022.
//

import Foundation
import EventKit

extension EKReminder {
    func update(using reminder: Reminder, in store: EKEventStore) {
        title = reminder.title
        notes = reminder.notes
        isCompleted = reminder.isComplete
        calendar = store.defaultCalendarForNewReminders()
        alarms?.forEach { alarms in
            guard let absoluteDate = alarms.absoluteDate else { return }
            let comparsion = Locale.current.calendar.compare(reminder.dueDate, to: absoluteDate, toGranularity: .minute)
            if comparsion != .orderedSame {
                removeAlarm(alarms)
            }
        }
        if !hasAlarms {
            addAlarm(EKAlarm(absoluteDate: reminder.dueDate))
        }
    }
}
