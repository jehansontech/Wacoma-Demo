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

    @EnvironmentObject var model: AppModel

    var body: some View {
        HStack(alignment: .center, spacing: 10) {

            Spacer()

            Button(action: {
                model.toggleColorScheme()
            }) {
                Image(systemName: "sun.max.fill")
            }

            Picker("", selection: $model.currentPage) {
                ForEach(Page.allCases, id: \.self) { p in
                    Text(p.rawValue).tag(p)
                }
            }
            .pickerStyle(.segmented)

            Spacer()
        }
        .preferredColorScheme(model.colorScheme) // put it here for convenience
    }
}

struct PageView: View {

    @EnvironmentObject var model: AppModel

    var body: some View {
        Group {
            switch model.currentPage {
            case .sections:
                Sections()
            case .navigation:
                Navigation()
            case .rotated:
                RotatedText()
            case .colors:
                ColorSequences()
            case .modals:
                ModalsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
