//
//  PickerView.swift
//  CustomPicker
//
//  Created by Sasha Myshkina on 09/02/2025.
//

import SwiftUI

struct PickerView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: PickerViewModel

    @Namespace private var customPicker

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(viewModel.title)
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
                .font(.system(size: 24))

            customPickerView
            Spacer()
        }
        .padding()
    }

    private var pickerView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Picker(viewModel.title, selection: $viewModel.selectedDate) {
                ForEach(viewModel.allDates, id: \.self) { date in
                    Text(viewModel.dateTitle(for: date))
                        .foregroundStyle(.primary)
                        .font(.system(size: 90))
                }
            }
            .pickerStyle(.segmented)
        }
    }

    private var customPickerView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(viewModel.allDates, id: \.self) { date in
                    Text(viewModel.dateTitle(for: date))
                        .foregroundStyle(.primary)
                        .font(.system(size: 15))
                        .padding(EdgeInsets(top: 7.5, leading: 20, bottom: 7.5, trailing: 20))
                        .matchedGeometryEffect(
                            id: date,
                            in: customPicker
                        )
                        .onTapGesture {
                            withAnimation {
                                viewModel.onDateTapped(date)
                            }
                        }
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AccentColor", bundle: nil))
                    .matchedGeometryEffect(
                        id: viewModel.selectedDate,
                        in: customPicker,
                        isSource: false
                    )
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.2))
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

#Preview {
    let dates = (0..<7).compactMap { Date().daysAdded($0) }
    return PickerView(viewModel: PickerViewModel(allDates: dates)!)
        .preferredColorScheme(.dark)
}
