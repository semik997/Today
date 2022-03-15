//
//  EKEventStore+AsyncFetch.swift
//  Today
//
//  Created by Sem Koliesnikov on 15.03.2022.
//

import Foundation
import EventKit

extension EKEventStore {
    
    func fetchReminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders = reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
