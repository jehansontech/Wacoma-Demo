//
//  Sections.swift
//  UIStuffForSwift-Demo
//
//  Created by Jim Hanson on 4/24/21.
//

import SwiftUI

struct Sections: View {
    

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {

                DisclosureGroup("Group 1") {
                    SectionContent("Group 1")
                        .frame(minHeight: 200)
                        .border(Color.gray)
                }
                DisclosureGroup("Group 2") {
                    SectionContent("Group 2")
                        .frame(minHeight: 200)
                        .border(Color.gray)
                }
            }
        }
    }
}

struct SectionContent: View {

    var name: String

    var body: some View {
        Text(name)
    }

    init(_ name: String) {
        self.name = name
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

