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
    @ObservedObject var globalVars: GlobalVars
    
    var countingLogic = CountingLogic()
    // timer vars
    @State var timeRemaining: Int
    @State var timerIsPaused = true
    @State var timer: Timer? = nil
    
    var body: some View {
        let currentExercise = LogicUtilites.returnCorrectExerciseArray(currentType: globalVars.type, globalVars: globalVars)[globalVars.index]
        
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
                            .foregroundColor(.accentColor)
                            .font(.system(.title))
                            .frame(width: 120, height: 20, alignment: .center)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    }
                    
                    Button(action: { // pause button
                        countingLogic.stopTimer(countingView: self)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.accentColor)
                            .font(.system(.title))
                            .frame(width: 120, height: 20, alignment: .center)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    }
                }.padding(.top)
                HStack {
                    Button(action: { // add 15 seconds button
                        countingLogic.add15seconds(countingView: self)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.accentColor)
                            .frame(width: 65, height: 10, alignment: .center)
                            .font(.system(size: 20))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    }
                    Button(action: { // sub 15 seconds button
                        countingLogic.sub15seconds(countingView: self)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.accentColor)
                            .frame(width: 65, height: 10, alignment: .center)
                            .font(.system(size: 20))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    }
                    
                    Button(action: { // reset time button
                        countingLogic.resetTimer(countingView: self, globalVars: globalVars)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.accentColor)
                            .frame(width: 65, height: 10, alignment: .center)
                            .font(.system(size: 20))
                            .padding()
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
            
        } else { // show sets and reps view
            SetsRepsView(globalVars: globalVars, currentExerciseAmount: currentExercise.amount)
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
