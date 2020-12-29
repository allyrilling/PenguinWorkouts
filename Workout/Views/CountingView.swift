//
//  TimerView.swift
//  Workout
//
//  Created by Ally Rilling on 7/24/20.
//

import SwiftUI

/*
 the view that displays the timer or the sets and reps
 */
struct CountingView: View {
    var currentExercise: Exercise
    var countingLogic = CountingLogic()
    /*
     the buttons to keep track of the sets
     */
    @ObservedObject var setButtonSelectionVars: SetButtonSelectionVars
    
    /*
     timer vars
     */
    @State var timeRemaining: Int
    @State var timerIsPaused = true
    @State var timer: Timer? = nil
    
    var body: some View {
        if currentExercise.isTimeBased { // show timer view
            VStack {
                HStack {
                    Button(action: { // play button
                        countingLogic.startTimer(countingView: self)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.accentColor)
                                    .frame(width: 40, height: 40)
                                Image(systemName: "play.fill")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    /*
                     shows time remaining
                     */
                    VStack {
                        Text("\(timeRemaining)")
                            .fontWeight(.bold)
                            .font(.system(size: 55))
                            .padding(.top)
                        Text("sec")
                            .fontWeight(.semibold)
                            .font(.system(size: 35))
                    }
                    
                    Button(action: { // pause button
                        countingLogic.stopTimer(countingView: self)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.accentColor)
                                    .frame(width: 40, height: 40)
                                Image(systemName: "pause.fill")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                HStack {
                    Button(action: { // add time button
                        countingLogic.add15seconds(countingView: self)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(.title))
                            Text("15 sec")
                                .foregroundColor(.black)
                        }.padding()
                        .background(Color.accentColor)
                        .cornerRadius(15)
                    }
                    
                    VStack {
                        ButtonWithText(sfSymbolName: "arrow.counterclockwise", buttonLabel: "", circleIsFirst: true)
                        Text("Reset")
                    }.onTapGesture {
                        countingLogic.resetTimer(countingView: self)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    
                    Spacer()
                    
                    ButtonWithText(sfSymbolName: "minus", buttonLabel: "15 sec", circleIsFirst: false)
                        .onTapGesture {
                            if timeRemaining > 15 {
                                countingLogic.sub15seconds(countingView: self)
                            }
                        }
                }.padding()
            }
        } else { // show sets and reps view
            SetsRepsView(countingView: self, setButtonSelectionVars: setButtonSelectionVars, countingLogic: countingLogic, currentExercise: currentExercise, currentExerciseAmount: currentExercise.amount)
        }
        
    }
    
}
