//
//  BrowserView.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 12/4/21.
//

import SwiftUI
import Wacoma

struct BrowserView : View {

    @State var pageName: String = "demo"
    @State var anchor: String? = nil

    var body: some View {
        HTMLResourceView($pageName, $anchor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
