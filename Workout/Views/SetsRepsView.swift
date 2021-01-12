//
//  SetsRepsView.swift
//  Workout
//
//  Created by Ally Rilling on 8/24/20.
//

import SwiftUI

struct SetsRepsView: View {
    @ObservedObject var globalVars: GlobalVars
    
    var body: some View {
        let currentExercise = LogicUtilites.returnCorrectExerciseArray(currentType: globalVars.type, globalVars: globalVars)[globalVars.index]
        
        VStack {
            HStack {
                Spacer()
                VStack { // amount text
                    Text(String(globalVars.reps))
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                    Text("Reps")
                        .font(.system(size: 25))
                }.padding()
                Spacer()
                VStack { // action buttons
                    Button(action: { // plus button
                        globalVars.reps = globalVars.reps + 1
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.accentColor)
                            .padding()
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    }
                    
                    Button(action: { // minus button
                        if globalVars.reps > 0 {
                            globalVars.reps = globalVars.reps - 1
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.accentColor)
                            .padding()
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    }
                    Button(action: { // reset button
                        globalVars.reps = currentExercise.amount
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.accentColor)
                            .padding()
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    }
                }.padding()
            }.background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("BackgroundColor"))
                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
            .padding()
            
            VStack {
                Slider(value: $globalVars.setsSliderValue, in: 0...3, step: 1) // set counter
                    .padding()
                Text("\(Int(globalVars.setsSliderValue)) of 3")
                    .font(.system(size: 30, weight: .bold))
                Text("Sets Completed")
                    .padding(.bottom)
            }.background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("BackgroundColor"))
                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
            .padding()
        }
    }
}
