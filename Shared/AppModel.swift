//
//  AppModel.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 11/28/21.
//

import Foundation

import SwiftUI
import Wacoma

enum Page: String, CaseIterable {
    case navigation = "Navigation"
    case sections = "Twisties"
    case rotated = "Rotated Text"
    case colors = "Colors"
}

class AppModel: ObservableObject {

    @Published var colorScheme = ColorScheme.dark

    @Published var currentPage = Page.sections

    @Published var defaultColorSequence = PresetColorSequence()

    @Published var rotationAngle: CGFloat = 0

    func toggleColorScheme() {
        switch colorScheme {
        case .dark:
            colorScheme = .light
        case .light:
            colorScheme = .dark
        @unknown default:
            fatalError("Unknown color scheme")
        }
    }

}
