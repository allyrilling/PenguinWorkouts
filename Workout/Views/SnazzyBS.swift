//
//  SnazzyBS.swift
//  Workout
//
//  Created by Ally Rilling on 6/1/21.
//

import SwiftUI

struct SnazzyBS: ButtonStyle {
    @ObservedObject var globalVars: GlobalVars
    
    @ViewBuilder func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //.background(configuration.isPressed ? RoundRectButtonStates(isPressed: true) : RoundRectButtonStates(isPressed: false))
            .foregroundColor(globalVars.mainColor)
            .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(globalVars.subColor))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

