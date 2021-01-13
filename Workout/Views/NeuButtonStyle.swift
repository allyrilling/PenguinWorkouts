//
//  NeuButtonStyle.swift
//  Workout
//
//  Created by Ally Rilling on 1/13/21.
//

import SwiftUI

struct NeuButtonStyle: ButtonStyle {
    var isRoundRect: Bool
    
    @ViewBuilder func makeBody(configuration: Configuration) -> some View {
        if (isRoundRect) {
            configuration.label
                .background(configuration.isPressed ? RoundRectButtonStates(isPressed: true) : RoundRectButtonStates(isPressed: false))
                .foregroundColor(.accentColor)
        } else {
            configuration.label
                .background(configuration.isPressed ? CapsuleButtonStates(isPressed: true) : CapsuleButtonStates(isPressed: false))
                .foregroundColor(.accentColor)
                .padding()
        }
    }
}

struct CapsuleButtonStates: View {
    var isPressed: Bool
    
    var body: some View {
        if (isPressed) {
            ZStack {
                Capsule()
                    .stroke(Color("NeuDark"), lineWidth: 2)
                    .blur(radius: 2)
                    .offset(x: 2, y: 2)
                    .mask(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color("NeuDark"), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                Capsule()
                    .stroke(Color.white, lineWidth: 2)
                    .blur(radius: 2)
                    .offset(x: -2, y: -2)
                    .mask(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color("NeuDark"), .clear]), startPoint: .bottomTrailing, endPoint: .topLeading)))
            }
        } else {
            Capsule()
                .foregroundColor(Color("BackgroundColor"))
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 5, y: 5)
                .shadow(color: Color.white, radius: 5, x: -5, y: -5)
        }
        
    }
}

struct RoundRectButtonStates: View {
    var isPressed: Bool
    
    var body: some View {
        if (isPressed) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("NeuDark"), lineWidth: 2)
                    .blur(radius: 2)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(gradient: Gradient(colors: [Color("NeuDark"), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 2)
                    .blur(radius: 2)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(gradient: Gradient(colors: [Color("NeuDark"), .clear]), startPoint: .bottomTrailing, endPoint: .topLeading)))
            }
        } else {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("BackgroundColor"))
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 5, y: 5)
                .shadow(color: Color.white, radius: 5, x: -5, y: -5)
        }
        
    }
}
