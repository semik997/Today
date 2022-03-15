//
//  TodayError.swift
//  Today
//
//  Created by Sem Koliesnikov on 15.03.2022.
//

import Foundation

enum TodayError: LocalizedError {
    case accessDenied
    case accessRestricted
    case failedReadingReminders
    case reminderHasNoDueDate
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .accessDenied:
            return NSLocalizedString("The app doesn't have permission to read reminders.", comment: "access denied erroe description")
        case .accessRestricted:
            return NSLocalizedString("This device doesn't allow access to reminders.", comment: "access restricted error description")
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date.", comment: "reminder has no due date error description")
        case .unknown:
            return NSLocalizedString("As unknown error occurred", comment: "unknown error description")
        }
    }
    
}

