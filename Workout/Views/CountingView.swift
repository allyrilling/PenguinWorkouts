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
    
    // timer vars
    @State var timeRemaining: Int
    @State var timerIsPaused = true
    @State var timer: Timer? = nil
    
    var body: some View {
        if currentExercise.isTimeBased { // show timer view
            VStack {
                Text("\(convertSecToMin(sec: timeRemaining))")
                    .fontWeight(.bold)
                    .font(.system(size: 80))
                    .padding(.top)
                HStack {
                    Button(action: { // play button
                        countingLogic.startTimer(countingView: self)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(.black)
                            .font(.system(.title))
                            .frame(width: 120, height: 20, alignment: .center)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                    Button(action: { // pause button
                        countingLogic.stopTimer(countingView: self)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.black)
                            .font(.system(.title))
                            .frame(width: 120, height: 20, alignment: .center)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                }.padding(.top)
                HStack {
                    Button(action: { // add 15 seconds button
                        countingLogic.add15seconds(countingView: self)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .frame(width: 65, height: 10, alignment: .center)
                            .font(.system(size: 20))
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                    Button(action: { // sub 15 seconds button
                        if timeRemaining > 15 {
                            countingLogic.sub15seconds(countingView: self)
                        }
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                            .frame(width: 65, height: 10, alignment: .center)
                            .font(.system(size: 20))
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                    
                    Button(action: { // reset time button
                        countingLogic.resetTimer(countingView: self)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                            .frame(width: 65, height: 10, alignment: .center)
                            .font(.system(size: 20))
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                }.padding()
            }.background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
            
        } else { // show sets and reps view
            SetsRepsView(countingView: self, setButtonSelectionVars: setButtonSelectionVars, countingLogic: countingLogic, currentExercise: currentExercise, currentExerciseAmount: currentExercise.amount, sliderValue: 0.0)
        }
        
    }
    
}

func convertSecToMin(sec: Int) -> String {
    var convertedString = ""
    if (sec < 60 && sec >= 10) {
        convertedString = "0:\(sec)"
    } else if (sec < 60 && sec < 10) {
        convertedString = "0:0\(sec)"
    } else if (sec%60 >= 0 && sec%60 <= 9) {
        convertedString = "\(sec/60):0\(sec%60)"
    } else {
        convertedString = "\(sec/60):\(sec%60)"
    }
    return convertedString
}
