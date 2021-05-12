//
//  SettingsViews.swift
//  UIStuffForSwift-Demo
//
//  Created by Jim Hanson on 4/24/21.
//

import SwiftUI
import UIStuffForSwift

struct Settings : View {

    @State var group1 = SettingsGroup()
    @State var group2 = SettingsGroup().itemStyle(.narrow)

    @State var alpha: Bool = false
    @State var beta: Int = 0
    @State var gamma: Double = 0
    @State var delta: String = "Fee"
    @State var epsilon: String = "grooved"

    var body: some View {
        // HStack {
            // Spacer()
            VStack(alignment: .leading, spacing: 10) {
                // Spacer()
                // Divider().background(UIConstants.darkGray)

                groupContent("Group 1 (default)", $group1)
                    .border(Color.gray)

                groupContent("Group 2 (narrow)", $group2)
                    .frame(maxWidth: 320)
                    .border(Color.gray)

                Spacer()
            }
            // Spacer()
        //}
    }

    func groupContent(_ name: String, _ group: Binding<SettingsGroup>) -> some View {
        VStack {
            Text(name)
            TickyboxSetting("Alpha", $alpha, group, "Yes", "No")
            SteppedSetting("Beta", $beta, group, 0, 100, [1, 10, 50])
            RangeSetting("Gamma", $gamma, group, 0, 100, 1)
            ChoiceSetting("Delta", $delta, group, ["Fee", "Fie", "Foe", "Fum"])
            TextSetting("Epsilon", $epsilon, group)
        }
    }
}
