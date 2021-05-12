//
//  Sections.swift
//  UIStuffForSwift-Demo
//
//  Created by Jim Hanson on 4/24/21.
//

import SwiftUI
import UIStuffForSwift

struct Sections: View {
    
    @State var group1 = TwistieGroup()
    @State var group2 = TwistieGroup().headerStyle(.fill)
    @State var group3 = TwistieGroup().autoCollapse(false)

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {

                twistieDemo("Group 1 (default)", $group1)
                Divider()
                twistieDemo("Group 2 (headerStyle = fill)", $group2)
                Divider()
                twistieDemo("Group 3 (autocollapse = false)", $group3)
                Spacer()
            }
            .animation(.easeInOut)

            Spacer()
        }
    }

    func twistieDemo(_ name: String, _ group: Binding<TwistieGroup>) -> some View {

        Group {
            Text(name)

            TwistieSection("Alpha", group) {
                VStack {
                    Text("Alpha Text 0")
                    Text("Alpha Text 1")
                    Text("Alpha Text 2")
                    Text("Alpha Text 3")
                    Text("Alpha Text 4")
                    Text("Alpha Text 5")
                    Text("Alpha Text 6")
                    Text("Alpha Text 7")
                    Text("Alpha Text 8")
                    Text("Alpha Text 9")
                }
            }

            TwistieSection("Beta", group) {
                VStack {
                    Text("Beta Text 0 is a bit wider")
                    Text("Beta Text 1 is a bit wider")
                    Text("Beta Text 2 is a bit wider")
                    Text("Beta Text 3 is a bit wider")
                    Text("Beta Text 4 is a bit wider")
                    Text("Beta Text 5 is a bit wider")
                    Text("Beta Text 6 is a bit wider")
                    Text("Beta Text 7 is a bit wider")
                    Text("Beta Text 8 is a bit wider")
                    Text("Beta Text 9 is a bit wider")
                }
            }

            TwistieSection("Gamma", group) {
                VStack {
                    Text("Gamma Text 0 is the widest of all the texts")
                    Text("Gamma Text 1 is the widest of all the texts")
                    Text("Gamma Text 2 is the widest of all the texts")
                    Text("Gamma Text 3 is the widest of all the texts")
                    Text("Gamma Text 4 is the widest of all the texts")
                    Text("Gamma Text 5 is the widest of all the texts")
                    Text("Gamma Text 6 is the widest of all the texts")
                    Text("Gamma Text 7 is the widest of all the texts")
                    Text("Gamma Text 8 is the widest of all the texts")
                    Text("Gamma Text 9 is the widest of all the texts")
                }
            }
        }
    }
}

