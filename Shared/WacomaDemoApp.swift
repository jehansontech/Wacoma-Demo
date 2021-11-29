//
//  WacomaDemoApp.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 5/12/21.
//

import SwiftUI

@main
struct WacomaDemoApp: App {

    @State var displayState = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(displayState)

        }
    }
}
