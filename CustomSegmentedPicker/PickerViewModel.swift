//
//  PickerViewModel.swift
//  CustomSegmentedPicker
//
//  Created by Sasha Myshkina on 09/02/2025.
//

import Combine
import Foundation
import SwiftUI

final class PickerViewModel: ObservableObject {

    @Published var selectedDate: Date

    @Published var allDates: [Date]

    @Published var title: String = ""

    private let formatter = DateFormatter()

    private var cancellables = Set<AnyCancellable>()

    init?(allDates: [Date]) {
        guard let firstDate = allDates.first else {
            return nil
        }
        self.allDates = allDates
        self.selectedDate = firstDate
        setupBindings()
    }

    private func setupBindings() {
        $selectedDate.sink { [weak self] date in
            guard let self else {
                return
            }
            formatter.dateFormat = "MMMM"
            title = formatter.string(from: date)
        }
        .store(in: &cancellables)
    }

    func dateTitle(for date: Date) -> String {
        formatter.dateFormat = "EEEE, d"
        return formatter.string(from: date)
    }

    func onDateTapped(_ date: Date) {
        selectedDate = date
    }
}
