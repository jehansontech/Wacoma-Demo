//
//  ModalsView.swift
//  Wacoma-Demo
//
//  Created by Jim Hanson on 12/1/21.
//

import SwiftUI

struct ModalContent: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .border(Color.gray)
            .padding()
    }
}

struct ModalsView: View {
    
    @State var popoverPresented = false
    
    @State var sheetPresented = false
    
    @State var fullScreenPresented = false
    
    var body: some View {
        VStack(spacing: 25) {

            Button {
                popoverPresented = true
            } label: {
                Text("Popover")
            }
            .popover(isPresented: $popoverPresented) {
                Text("Popover Contents")
                    .modifier(ModalContent())
            }

            Button {
                sheetPresented = true
            } label: {
                Text("Sheet")
            }
            .sheet(isPresented: $sheetPresented) {
                SheetContents(name: "Sheet contents", isPresented: $sheetPresented)
                    .modifier(ModalContent())
            }

#if os(macOS)
            Text("FullScreenCover is not available on macOS")
#else
            Button {
                fullScreenPresented = true
            } label: {
                Text("FullScreenCover")
            }
            .fullScreenCover(isPresented: $fullScreenPresented) {
                SheetContents(name: "FullScreenCover contents", isPresented: $fullScreenPresented)
                    .modifier(ModalContent())
            }
#endif

        }
    }
}


struct SheetContents: View {
    
    var name: String
    
    @Binding  var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text(name)
            Button {
                isPresented = false
            } label: {
                Text("Dismiss")
            }
        }
    }
}
