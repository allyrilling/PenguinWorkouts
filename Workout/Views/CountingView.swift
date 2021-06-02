//
//  TimerView.swift
//  Workout
//
//  Created by Ally Rilling on 7/24/20.
//

import SwiftUI
import AudioToolbox

/*
 the view that displays the timer or the sets and reps
 */
struct CountingView: View {
    @ObservedObject var globalVars: GlobalVars
    var countingLogic = CountingLogic()
    
    var body: some View {
        let currentExercise = LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[globalVars.index]
        
        if currentExercise.isTimeBased { // show timer view
            VStack {
                Text("\(convertSecToMin(sec: globalVars.timeRemaining))")
                    .fontWeight(.bold)
                    .font(.system(size: 80))
                    .padding(.top)
                HStack {
                    Button(action: { // play button
                        CountingLogic.startTimer(globalVars: globalVars)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(.accentColor)
                            .font(.system(.title))
                            .frame(width: 120, height: 20, alignment: .center)
                            .padding()
                    }.buttonStyle(SnazzyBS(globalVars: globalVars))
                    
                    Button(action: { // pause button
                        CountingLogic.stopTimer(globalVars: globalVars)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.accentColor)
                            .font(.system(.title))
                            .frame(width: 120, height: 20, alignment: .center)
                            .padding()
                    }.buttonStyle(SnazzyBS(globalVars: globalVars))
                }.padding(.top)
                
                HStack {
                    Button(action: { // add 15 seconds button
                        CountingLogic.add15seconds(globalVars: globalVars)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("15")
                        }.foregroundColor(.accentColor)
                        .frame(width: 65, height: 10, alignment: .center)
                        .font(.system(size: 20))
                        .padding()
                    }.buttonStyle(SnazzyBS(globalVars: globalVars))
                    
                    Button(action: { // sub 15 seconds button
                        CountingLogic.sub15seconds(globalVars: globalVars)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }) {
                        HStack {
                            Image(systemName: "minus")
                            Text("15")
                        }.foregroundColor(.accentColor)
                        .frame(width: 65, height: 10, alignment: .center)
                        .font(.system(size: 20))
                        .padding()
                    }.buttonStyle(SnazzyBS(globalVars: globalVars))
                    
                    Button(action: { // reset time button
                        CountingLogic.resetTimer(globalVars: globalVars)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.accentColor)
                            .frame(width: 65, height: 10, alignment: .center)
                            .font(.system(size: 20))
                            .padding()
                    }.buttonStyle(SnazzyBS(globalVars: globalVars))
                }.padding()
            }.background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white))
            .padding()
            .accentColor(globalVars.mainColor)
        } else { // show sets and reps view
            SetsRepsView(globalVars: globalVars)
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
