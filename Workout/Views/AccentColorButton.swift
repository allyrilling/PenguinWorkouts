//
//  AccentColorButton.swift
//  Workout
//
//  Created by Ally Rilling on 5/23/21.
//

import SwiftUI

struct AccentColorButton: View {
    @ObservedObject var globalVars: GlobalVars
    var color: Color
    
    var body: some View {
        Button(action: {
            globalVars.accentColor = color
        }, label: {
            Circle()
                .foregroundColor(color)
                .frame(width: 30, height: 30)
                .padding(5)
                .background(Circle()
                                .stroke(globalVars.accentColor == color ? Color.black : Color.clear))
        })
    }
}

