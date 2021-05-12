//
//  ContentView.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 5/12/21.
//

import SwiftUI
import WacomaUI

enum SelectedLayer {
    case settings
    case sections
    case navigation
}

struct ContentView: View {

    @State var selectedLayer: SelectedLayer = .settings

    var body: some View {

        VStack {

            HStack {
                Button(action: {
                    selectedLayer = .settings
                }) {
                    Text("Settings")
                }
                .modifier(TextButtonStyle())

                Button(action: {
                    selectedLayer = .sections
                }) {
                    Text("Sections")
                }
                .modifier(TextButtonStyle())

                Button(action: {
                    selectedLayer = .navigation
                }) {
                    Text("Navigation")
                }
                .modifier(TextButtonStyle())

            }

            ZStack {
                Settings()
                    .foregroundColor(UIConstants.offWhite)
                    .background(UIConstants.offBlack)
                    .border(UIConstants.darkGray)
                    .padding(UIConstants.pageInsets)
                    .zIndex(selectedLayer == .settings ? 200 : 100)

                Sections()
                    .foregroundColor(UIConstants.offWhite)
                    .background(UIConstants.offBlack)
                    .border(UIConstants.darkGray)
                    .padding(UIConstants.pageInsets)
                    .zIndex(selectedLayer == .sections ? 200 : 100)

                Navigation()
                    .foregroundColor(UIConstants.offWhite)
                    .background(UIConstants.offBlack)
                    .border(UIConstants.darkGray)
                    .padding(UIConstants.pageInsets)
                    .zIndex(selectedLayer == .navigation ? 200 : 100)

            }
        }
    }
}
