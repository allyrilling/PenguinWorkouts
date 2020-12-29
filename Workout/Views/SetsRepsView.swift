//
//  SetsRepsView.swift
//  Workout
//
//  Created by Ally Rilling on 8/24/20.
//

import SwiftUI

struct SetsRepsView: View {
    var countingView: CountingView
    /*
     the buttons to keep track of the sets
     */
    @ObservedObject var setButtonSelectionVars: SetButtonSelectionVars
    var countingLogic: CountingLogic
    var currentExercise: Exercise
    @State var currentExerciseAmount: Int
    
    @State var sliderValue: Double
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack { // amount text
                    Text(String(currentExerciseAmount))
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                    Text("Reps")
                        .font(.system(size: 25))
                }.padding()
                Spacer()
                VStack { // action buttons
                    Button(action: { // plus button
                        currentExerciseAmount = currentExerciseAmount + 1
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                    Button(action: { // minus button
                        if currentExerciseAmount > 0 {
                            currentExerciseAmount = currentExerciseAmount - 1
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                    Button(action: { // reset button
                        currentExerciseAmount = currentExercise.amount
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                }.padding()
            }.background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
            .padding()
            
            VStack {
                Slider(value: $sliderValue, in: 0...3, step: 1) // set counter
                    .padding()
                Text("\(Int(sliderValue)) of 3")
                    .font(.system(size: 30, weight: .bold))
                Text("Sets Completed")
                    .padding(.bottom)
            }.background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
            .padding()
        }
    }
}
