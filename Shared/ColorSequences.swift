//
//  ColorSequences.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 11/29/21.
//

import SwiftUI
import Wacoma

struct ColorSequences: View {

    @EnvironmentObject var model: AppModel

    var body: some View {
        VStack {
            HStack {
                ForEach(model.defaultColorSequence.colors, id: \.self) { color in
                    Rectangle().foregroundColor(color).frame(width: 50, height: 50)
                }
            }
            Text("Default Colors")
        }
    }
}

