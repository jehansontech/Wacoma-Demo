//
//  Sections.swift
//  UIStuffForSwift-Demo
//
//  Created by Jim Hanson on 4/24/21.
//

import SwiftUI

struct Sections: View {
    
//    @State var group1 = TwistieGroup()
//    @State var group2 = TwistieGroup().headerStyle(.fill)
//    @State var group3 = TwistieGroup().autoCollapse(false)

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
//
//                twistieDemo("Group 1 (default)", $group1)
//                Divider()
//                twistieDemo("Group 2 (headerStyle = fill)", $group2)
//                Divider()
//                twistieDemo("Group 3 (autocollapse = false)", $group3)
//                Spacer()
            }
            .animation(.easeInOut)

            Spacer()
        }
    }

//    func twistieDemo(_ name: String, _ group: Binding<TwistieGroup>) -> some View {
//
//        Group {
//            Text(name)
//
//            TwistieSection("Alpha", group) {
//                VStack {
//                    Text("Alpha Text 0")
//                    Text("Alpha Text 1")
//                }
//            }
//
//            TwistieSection("Beta", group) {
//                VStack {
//                    Text("Beta Text 0 is a bit wider")
//                    Text("Beta Text 1")
//                }
//            }
//
//            TwistieSection("Gamma", group) {
//                VStack {
//                    Text("Gamma Text 0 is the widest of all the texts")
//                }
//            }
//        }
//    }
}

