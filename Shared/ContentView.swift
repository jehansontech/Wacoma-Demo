//
//  ContentView.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 5/12/21.
//

import SwiftUI

struct ContentView: View {

    @State var page: Page = .sections

    var body: some View {
        DisplayControls()
            .padding()
        PageView()
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DisplayControls: View {

    @EnvironmentObject var displayState: DisplayState

    var body: some View {
        HStack(alignment: .center, spacing: 10) {

            Spacer()

            Button(action: {
                displayState.dark = !displayState.dark
            }) {
                // lightbulb
                Image(systemName: "sun.max.fill")
            }

            Picker("", selection: $displayState.currentPage) {
                ForEach(Page.allCases, id: \.self) { p in
                    Text(p.rawValue).tag(p)
                }
            }
            .pickerStyle(.segmented)

            Spacer()
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
