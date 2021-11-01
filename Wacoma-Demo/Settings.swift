//
//  SettingsViews.swift
//  UIStuffForSwift-Demo
//
//  Created by Jim Hanson on 4/24/21.
//

import SwiftUI
import WacomaUI

struct Settings : View {

    @State var group1 = SettingsGroup()
    @State var group2 = SettingsGroup().itemStyle(.narrow)

    @State var foo: String = "Foo"
    @State var alpha: Bool = false
    @State var beta: Int = 0
    @State var gamma: Double = 0
    @State var delta: String = "Fee"
    @State var epsilon: String = "grooved"

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Spacer()

            HStack {
                groupContent("Group 1 (default)", $group1)
                Spacer()
                    .border(Color.gray)
            }
            Divider().background(UIConstants.darkGray)
            HStack {
                groupContent("Group 2 (narrow)", $group2)
                    .frame(maxWidth: 320)
                Spacer()
                    .border(Color.gray)
            }
            Spacer()
                .border(Color.gray)
        }
    }

    func groupContent(_ name: String, _ group: Binding<SettingsGroup>) -> some View {
        VStack(alignment: .leading) {
            Text(name)
            ReadOnlySetting("Foo", $foo, group)
            TickyboxSetting("Alpha", $alpha, group, "Yes", "No")
                .border(Color.blue)
            SteppedSetting("Beta", $beta, group, 0, 100, [1, 10, 50])
                .border(Color.blue)
            RangeSetting("Gamma", $gamma, group, 0, 100, 1)
            ChoiceSetting("Delta", $delta, group, ["Fee", "Fie", "Foe", "Fum"])
            TextSetting("Epsilon", $epsilon, group)
        }
    }
}
