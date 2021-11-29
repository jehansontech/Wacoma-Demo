//
//  RotatedText.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 11/29/21.
//

import SwiftUI
import Wacoma

struct RotatedText: View {

    @EnvironmentObject var model: AppModel

    var size: CGFloat = 300

    var degrees: Int {
        return Int(model.rotationAngle)
    }

    var body: some View {
        VStack {
            ZStack {
                Rectangle().foregroundColor(Color.gray).frame(width: size, height: size)
                Text("Rotation = \(degrees)\u{00b0}")
                    .rotated(by: .degrees(model.rotationAngle))
            }
            Slider(value: $model.rotationAngle, in: 0...359)
                .frame(width: size)
        }
    }
}
