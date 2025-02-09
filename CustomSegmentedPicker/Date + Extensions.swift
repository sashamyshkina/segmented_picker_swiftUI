//
//  Date + Extensions.swift
//  CustomSegmentedPicker
//
//  Created by Sasha Myshkina on 09/02/2025.
//

import Foundation

extension Date {
    func daysAdded(_ days: Int) -> Date? {
        guard let date = Calendar.current.date(byAdding: .day, value: days, to: self) else {
            return nil
        }

        return Calendar.current.startOfDay(for: date)
    }
}
