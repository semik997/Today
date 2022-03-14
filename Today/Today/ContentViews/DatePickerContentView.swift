//
//  DatePickerContentView.swift
//  Today
//
//  Created by Sem Koliesnikov on 11.03.2022.
//

import UIKit

class DatePickerContentView: UIView, UIContentView {
    
    struct Configuration: UIContentConfiguration {
        var date = Date.now
        var onChange: (Date) -> Void = { _ in }
        
        func makeContentView() -> UIView & UIContentView {
            return DatePickerContentView(self)
        }
    }
    
    let dataPicker = UIDatePicker()
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(dataPicker)
        dataPicker.addTarget(self, action: #selector(didPick(_:)), for: .valueChanged)
        dataPicker.preferredDatePickerStyle = .wheels
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        dataPicker.date = configuration.date
    }
    
    @objc private func didPick(_ senser: UIDatePicker) {
        guard let configuration = configuration as? DatePickerContentView.Configuration else { return }
        configuration.onChange(senser.date)
    }
}

extension UICollectionViewListCell {
    
    func datePickerConfiguration() -> DatePickerContentView.Configuration {
        DatePickerContentView.Configuration()
    }
}
