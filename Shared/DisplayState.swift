//
//  DisplayState.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 11/28/21.
//

import Foundation

import SwiftUI

enum Page: String, CaseIterable, Identifiable {
    case navigation = "Navigation"
    case sections = "Twistie Sections"
    case rotated = "Rotated Text"

    var id: String { return self.rawValue }
}

class DisplayState: ObservableObject {

    @Published var dark: Bool = false

    @Published var currentPage: Page = .sections
}
