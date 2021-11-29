//
//  ColorSequences.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 11/29/21.
//

import SwiftUI
import Wacoma

struct ColorSequences: View {

    var size: CGFloat = 24
    @EnvironmentObject var model: AppModel

    var body: some View {
        VStack {
            HStack {
                ForEach(model.defaultColorSequence.colors, id: \.self) { color in
                    Rectangle().foregroundColor(color).frame(width: size, height: size)
                }
            }
            Text("Default Color Sequence")
        }
    }
}

