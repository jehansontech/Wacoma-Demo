//
//  Sections.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 4/24/21.
//

import SwiftUI

struct Sections: View {
    
    var sectionCount: Int = 4

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                ForEach(1...sectionCount, id: \.self) { idx in
                    DisclosureGroup("Section \(idx)") {
                        SectionContent("Section \(idx)")
                            .modifier(SectionStyle())
                    }
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
}

struct SectionStyle: ViewModifier {

    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 200)
            .border(Color.gray)
    }

}

