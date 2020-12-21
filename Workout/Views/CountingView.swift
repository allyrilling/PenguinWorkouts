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
        /*
         uses the timer
         */
        if currentExercise.isTimeBased {
            VStack {
                
                HStack {
                    /*
                     timer play button
                     */
                    TimerButtonView(imageSystemName: "play.fill")
                        .onTapGesture {
                            countingLogic.startTimer(countingView: self)
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        }
                    
                    Spacer()
                    
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
                    
                    Spacer()
                    
                    /*
                     timer pause button
                     */
                    TimerButtonView(imageSystemName: "pause.fill")
                        .onTapGesture {
                            countingLogic.stopTimer(countingView: self)
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        }
                }
                
                HStack {
                    
                    ButtonWithText(sfSymbolName: "plus", buttonLabel: "15 sec", circleIsFirst: true)
                        .onTapGesture {
                            countingLogic.add15seconds(countingView: self)
                        }
                    
                    Spacer()
                    
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
                    
                }.padding([.horizontal, .bottom])
            }.overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.accentColor, lineWidth: 3)
            )
            .padding([.horizontal, .bottom])
            
            
            /*
             uses sets and reps
             */
        } else {
            SetsRepsView(countingView: self, setButtonSelectionVars: setButtonSelectionVars, countingLogic: countingLogic, currentExercise: currentExercise, currentExerciseAmount: currentExercise.amount)
        }
        
    }
    
}
