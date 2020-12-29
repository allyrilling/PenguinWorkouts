//
//  HowToView.swift
//  Workout
//
//  Created by Ally Rilling on 8/2/20.
//

import SwiftUI

/*
 shows the video of each exercise
 */
struct HowToView: View {
    @ObservedObject var logic: Logic
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    
    var body: some View {
        let currentExerciseType = currentExerciseVars.currentExerciseType
        let currentExerciseIndex = currentExerciseVars.currentExerciseIndex
        let currentExercise = logic.returnCorrectExerciseArray(currentType: currentExerciseType)[currentExerciseIndex]
        
        ScrollView {
            VStack {
                VStack {
                    Text("Starting Position")
                        .font(.system(size: 37, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    Text(currentExercise.startingPosition)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                }.padding()
                .background(Color.white.cornerRadius(15))
                
                // maybe make this some kind of list view
                Text(currentExercise.description)
                    .lineLimit(10)
                    .fixedSize(horizontal: false, vertical: true)
            }.padding()
        }.background(Color.gray.edgesIgnoringSafeArea(.all)
                        .opacity(0.1))
    }
}
