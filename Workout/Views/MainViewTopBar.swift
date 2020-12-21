//
//  MainViewTopBar.swift
//  Workout
//
//  Created by Ally Rilling on 7/28/20.
//

import SwiftUI

/*
 the bar housing the randomize and configure buttons
 */
struct MainViewTopBar: View {
    @ObservedObject var logic: Logic
    @State var motherView: MotherView
    /*
     current type is so that when navigating back to main view the type the user had selected before is still selected after
     */
    var currentType: String
    
    var body: some View {
        HStack {
            /*
             the randomize button
             */
            ButtonWithText(sfSymbolName: "shuffle", buttonLabel: "Randomize", circleIsFirst: true)
                .padding(.leading)
                .onTapGesture {
                    LogicUtilites.randomizeExercies(logic: logic)
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
            
            Spacer()
            /*
             mid divider
             */
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 2, height: 40)
                .foregroundColor(Color.accentColor)
                .opacity(0.5)
            Spacer()
            
            /*
             the configure button
             */
            ButtonWithText(sfSymbolName: "gear", buttonLabel: "Configure", circleIsFirst: false)
                .padding(.trailing)
                .onTapGesture {
                    motherView.currentExerciseVars.currentExerciseType = currentType
                    motherView.viewState = ViewKeys.configureViewState.rawValue
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                }
        }
    }
}
