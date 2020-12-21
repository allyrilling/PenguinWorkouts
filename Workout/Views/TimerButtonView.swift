//
//  TimerButtonView.swift
//  Workout
//
//  Created by Ally Rilling on 8/2/20.
//

import SwiftUI

/*
 play and pause buttons for timer
 */
struct TimerButtonView: View {
    var imageSystemName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.accentColor)
                .frame(width: 60, height: 60)
            Image(systemName: imageSystemName)
                .font(.system(size: 30))
        }.padding([.horizontal, .top])
    }
    
}

