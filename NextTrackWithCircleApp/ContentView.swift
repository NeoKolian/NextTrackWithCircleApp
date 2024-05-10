//
//  ContentView.swift
//  NextTrackWithCircleApp
//
//  Created by Nikolay Pochekuev on 08.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var performAnimation: Bool = false
    
    var body: some View {
        Button {
            if !performAnimation {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    performAnimation = true
                } completion: {
                    performAnimation = false
                }
            }
        } label: {
            GeometryReader { proxy in
                let width = proxy.size.width / 2
                let systemName = "play.fill"
                
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: performAnimation ? width : 0)
                        .opacity(performAnimation ? 1 : 0)
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width)
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: performAnimation ? 0.5 : width)
                        .opacity(performAnimation ? 0 : 1)
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
        .buttonStyle(CustomButtonStyle())
        .frame(maxWidth: 64, maxHeight: 64)
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(configuration.isPressed ? Color(.systemGray6) : Color(.clear))
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.86 : 1)
            .animation(.interpolatingSpring(duration: 0.22), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
