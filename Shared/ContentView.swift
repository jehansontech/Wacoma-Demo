//
//  ContentView.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 5/12/21.
//

import SwiftUI
import WacomaUI

struct ContentView: View {

    @State var page: Page = .sections

    var body: some View {
        DisplayControls()
            .padding()
        PageView()
            .padding()
    }
}

struct DisplayControls: View {

    @EnvironmentObject var displayState: DisplayState

    var body: some View {
        HStack(alignment: .center, spacing: 10) {

            Button(action: {
                displayState.dark = !displayState.dark
            }) {
                Text(displayState.dark ? "Light" : "Dark")
            }

            Picker("", selection: $displayState.currentPage) {
                ForEach(Page.allCases, id: \.self) { p in
                    Text(p.rawValue).tag(p)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct PageView: View {

    @EnvironmentObject var displayState: DisplayState

    var body: some View {
        Group {
            switch displayState.currentPage {
//            case .v1Settings:
//                V1Settings()
            case .sections:
                Sections()
            case .navigation:
                Navigation()
            }
        }
        .preferredColorScheme(displayState.dark ? .dark : .light) // put it here for convenience
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
