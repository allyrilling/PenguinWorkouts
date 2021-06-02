//
//  SecondaryColorButton.swift
//  Workout
//
//  Created by Ally Rilling on 5/23/21.
//

import SwiftUI

struct SecondaryColorButton: View {
    @ObservedObject var globalVars: GlobalVars
    var color: Color
    
    var body: some View {
        Button(action: {
            globalVars.subColor = color.opacity(0.2)
        }, label: {
            Circle()
                .foregroundColor(color)
                .opacity(0.3)
                .frame(width: 30, height: 30)
                .padding(5)
                .background(Circle()
                                .stroke(globalVars.subColor == color.opacity(0.2) ? Color.black : Color.clear))
        })
    }
}

