//
//  CAGradientLayer+ListStyle.swift
//  Today
//
//  Created by Sem Koliesnikov on 15.03.2022.
//

import UIKit
import QuartzCore

extension CAGradientLayer {
    
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .today:
            beginColor = .todayGradientTodayBegin
            endColor = .todayGradientTodayEnd
        case .future:
            beginColor = .todayGradientFutureBegin
            endColor = .todayGradientFutureEnd
        case .all:
            beginColor = .todayGradientAllBegin
            endColor = .todayGradientAllEnd
        }
        return [beginColor.cgColor, endColor.cgColor]
    }
    
}

