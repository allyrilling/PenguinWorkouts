//
//  ButtonWithText.swift
//  Workout
//
//  Created by Ally Rilling on 7/31/20.
//

import SwiftUI

/*
 generic button with text and a symbol by it
 */
struct ButtonWithText: View {
    var sfSymbolName: String
    var buttonLabel: String
    var circleIsFirst: Bool
    
    var body: some View {
        
        if circleIsFirst {
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(Color.accentColor)
                        .frame(width: 40, height: 40)
                    Image(systemName: sfSymbolName)
                }
                Text(buttonLabel)
            }
        } else {
            HStack {
                Text(buttonLabel)
                ZStack {
                    Circle()
                        .foregroundColor(Color.accentColor)
                        .frame(width: 40, height: 40)
                    Image(systemName: sfSymbolName)
                }
            }
        }
        
        
    }
}

