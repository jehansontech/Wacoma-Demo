//
//  Navigation.swift
//  UIStuffForSwift-Demo
//
//  Created by Jim Hanson on 4/24/21.
//

import SwiftUI

enum NavItemType: CaseIterable {
    case foo
    case bar
    case bax
}

protocol NavItem {

    var type: NavItemType { get }

    var name: String { get }

    func setup()

    func teardown()

}


struct Foo: NavItem {

    let type: NavItemType = .foo

    let name: String

    init(_ name: String) {
        self.name = name
    }

    func setup() {

    }

    func teardown() {

    }
}

struct FooSettingsView: View {

    @Binding var item: Foo

    var body: some View {
        Text("FooSettingsView")
            .modifier(NavBarStyle("\(item.name)"))
    }

    init(_ item: Binding<Foo>) {
        self._item = item
    }
}

struct FooDisplayView: View {

    @Binding var item: Foo

    var body: some View {
        Text("FooDisplayView")
            .modifier(NavBarStyle("\(item.name)"))
    }

    init(_ item: Binding<Foo>) {
        self._item = item
    }

}


class Bar: NavItem {

    let type: NavItemType = .bar

    let name: String

    init(_ name: String) {
        self.name = name
    }

    func setup() {

    }

    func teardown() {

    }
}

struct BarSettingsView: View {

    @Binding var item: Bar

    var body: some View {
        Text("BarSettingsView")
            .modifier(NavBarStyle("\(item.name)"))
    }

    init(_ item: Binding<Bar>) {
        self._item = item
    }
}

struct BarDisplayView: View {

    @Binding var item: Bar

    var body: some View {
        Text("BarDisplayView")
            .modifier(NavBarStyle("\(item.name)"))
    }

    init(_ item: Binding<Bar>) {
        self._item = item
    }

}


class Bax: NavItem {

    let type: NavItemType = .bax

    let name: String

    init(_ name: String) {
        self.name = name
    }

    func setup() {

    }

    func teardown() {

    }
}

struct BaxSettingsView: View {

    @Binding var item: Bax

    var body: some View {
        Text("BaxSettingsView")
            .modifier(NavBarStyle("\(item.name)"))
    }

    init(_ item: Binding<Bax>) {
        self._item = item
    }
}

struct BaxDisplayView: View {

    @Binding var item: Bax

    var body: some View {
        Text("BaxDisplayView")
            .modifier(NavBarStyle("\(item.name)"))
    }

    init(_ item: Binding<Bax>) {
        self._item = item
    }

}

struct EmptySettingsView: View {

    let name: String

    var body: some View {
        Text("\(name)SettingsView")
            .modifier(NavBarStyle("\(name)"))
    }

    init(_ name: String) {
        self.name = name
    }
}

struct EmptyDisplayView: View {

    let name: String

    var body: some View {
        Text("\(name)DisplayView")
            .modifier(NavBarStyle("\(name)"))
    }

    init(_ name: String) {
        self.name = name
    }
}


class NavRegistry: ObservableObject {

    @State var foo1 = Foo("Foo 1")
    @State var foo2 = Foo("Foo 2")
    @State var bar  = Bar("Bar")
    @State var bax  = Bax("Bax")

    var itemNames: [String] {
        return [foo1.name, foo2.name, bar.name, bax.name]
    }

    @Published var selectionName: String = ""

    func select(_ name: String) {
        if name == self.selectionName {
            return
        }

        teardown(name)
        self.selectionName = name
        setup(name)
    }

    func settingsView(_ itemName: String) -> some View {
        Group { // [self] in
            switch itemName {
//            case foo1.name:
//                FooSettingsView($foo1)
//            case foo2.name:
//                FooSettingsView($foo2)
//            case bar.name:
//                BarSettingsView($bar)
//            case bax.name:
//                BaxSettingsView($bax)
            default:
                EmptySettingsView(itemName)
            }
        }
    }

    func displayView(_ itemName: String) -> some View {
        Group {
            switch itemName {
//            case self.foo1.name:
//                FooDisplayView($foo1)
//            case self.foo2.name:
//                FooDisplayView($foo2)
//            case self.bar.name:
//                BarDisplayView($bar)
//            case self.bax.name:
//                BaxDisplayView($bax)
            default:
                EmptyDisplayView(itemName)
            }
        }
    }

    private func setup(_ itemName: String) {
        switch itemName {
        case foo1.name:
            foo1.setup()
        case foo2.name:
            foo2.setup()
        case bar.name:
            bar.setup()
        case bax.name:
            bax.setup()
        default:
            break
        }
    }

    private func teardown(_ itemName: String) {
        switch itemName {
        case foo1.name:
            foo1.teardown()
        case foo2.name:
            foo2.teardown()
        case bar.name:
            bar.teardown()
        case bax.name:
            bax.teardown()
        default:
            break
        }
    }
}

struct NavSelectorView : View {

    @EnvironmentObject var registry: NavRegistry

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Spacer().frame(height: 0) // shift top button down by spacing
            ForEach(registry.itemNames, id: \.self) { name in

                NavigationLink(destination: registry.settingsView(name)
                                .onAppear(perform: { registry.select(name) })) {
                    HStack {
                        Text("\(name)")
                        Spacer()
                        Image(systemName: "chevron.right")
                            // .foregroundColor(UIConstants.controlColor)
                    }
                    // .modifier(SpanningButtonStyle())
                }
            }
            Spacer()
        }
//        .foregroundColor(UIConstants.offWhite)
//        .background(UIConstants.offBlack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(NavBarStyle("Items"))
    }
}

struct NavDisplayView: View {

    @EnvironmentObject var registry: NavRegistry

    var body: some View {
        registry.displayView(registry.selectionName)
//            .foregroundColor(UIConstants.offWhite)
//            .background(UIConstants.offBlack)
            .modifier(NavBarStyle("\(registry.selectionName)"))
    }
}

struct Navigation: View {

    @StateObject var registry = NavRegistry()

    var body: some View {
        NavigationView {
            NavSelectorView()
            NavDisplayView()
        }
        .environmentObject(registry)
    }
}

struct NavBarStyle: ViewModifier {

    var title: String

    public func body(content: Content) -> some View {
#if os(iOS)
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
#elseif os(macOS)
        content
            .navigationTitle(title)
#endif
    }

    init(_ title: String) {
        self.title = title
    }
}
