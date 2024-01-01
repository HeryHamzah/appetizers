//
//  ViewModifiers.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 29/12/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }

}

extension View {
    
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
