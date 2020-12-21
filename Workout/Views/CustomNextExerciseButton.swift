//
//  CustomNextExerciseButton.swift
//  Workout
//
//  Created by Ally Rilling on 8/2/20.
//

import SwiftUI

/*
 button goes to the next exercise in the detail view
 */
struct CustomNextExerciseButton: View {
    @State var motherView: MotherView
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    
    var body: some View {
        ButtonWithText(sfSymbolName: "arrow.right", buttonLabel: "Next Exercise", circleIsFirst: false)
            .onTapGesture {
                /*
                 increments index
                 does hacky thing to refresh the detail view state based on the even or odd index of the exercise
                 */
                currentExerciseVars.currentExerciseIndex = currentExerciseVars.currentExerciseIndex + 1
                if currentExerciseVars.currentExerciseIndex % 2 == 0 {
                    motherView.viewState = ViewKeys.detailViewState.rawValue
                } else {
                    motherView.viewState = ViewKeys.detailViewState2.rawValue
                }
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
    }
}

