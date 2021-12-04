//
//  BrowserView.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 12/4/21.
//

import SwiftUI
import Wacoma

struct BrowserView : View {

    let pageName: String = "demo"

    var body: some View {
        WKWebViewWrapper(pageName)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
