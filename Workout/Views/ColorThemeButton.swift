//
//  AccentColorButton.swift
//  Workout
//
//  Created by Ally Rilling on 5/23/21.
//

import SwiftUI

struct ColorThemeButton: View {
    @ObservedObject var globalVars: GlobalVars
    var theme: [Int]
    
    var frameHeight: CGFloat = 20
    var cr: CGFloat = 5
    
    var body: some View {
        Button(action: {
            globalVars.mainColor = Color(hex: UInt(theme[0]))
            globalVars.subColor = Color(hex: UInt(theme[1]))
            globalVars.accentColor = Color(hex: UInt(theme[2]))
            globalVars.defaults.set(theme, forKey: "theme")
        }, label: {
            VStack {
                RoundedRectangle(cornerRadius: cr)
                    .frame(height: frameHeight)
                    .foregroundColor(Color(hex: UInt(theme[0])))
                RoundedRectangle(cornerRadius: cr)
                    .frame(height: frameHeight)
                    .foregroundColor(Color(hex: UInt(theme[1])))
                RoundedRectangle(cornerRadius: cr)
                    .frame(height: frameHeight)
                    .foregroundColor(Color(hex: UInt(theme[2])))
            }.padding()
            .background(ZStack {
                RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .foregroundColor(globalVars.mainColor == Color(hex: UInt(theme[0])) ? .black : .clear)
            })
        })
    }
}

