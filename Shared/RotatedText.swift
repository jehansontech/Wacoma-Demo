//
//  RotatedText.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 11/29/21.
//

import SwiftUI
import Wacoma

struct RotatedText: View {

    var size: CGFloat = 300

    @State var angle: CGFloat = 0

    var degrees: Int {
        return Int(angle)
    }
    var body: some View {
        VStack {
            ZStack {
                Rectangle().foregroundColor(Color.gray).frame(width: size, height: size)
                Text("Rotation = \(degrees)\u{00b0}")
                    .rotated(by: .degrees(angle))
            }
            Slider(value: $angle, in: 0...359)
                .frame(width: size)
        }
    }
}
