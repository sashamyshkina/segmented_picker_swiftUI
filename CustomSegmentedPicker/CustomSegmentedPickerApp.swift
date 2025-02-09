//
//  CustomSegmentedPickerApp.swift
//  CustomSegmentedPicker
//
//  Created by Sasha Myshkina on 09/02/2025.
//

import SwiftUI

@main
struct CustomPickerApp: App {
    var body: some Scene {
        WindowGroup {
            let dates = (0..<7).compactMap { Date().daysAdded($0) }

            if let viewModel = PickerViewModel(allDates: dates) {
                PickerView(viewModel: viewModel)
                    .preferredColorScheme(.dark)
            } else {
                EmptyView()
            }
        }
    }
}
