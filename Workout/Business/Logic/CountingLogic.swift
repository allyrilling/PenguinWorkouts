//
//  TimerLogic.swift
//  Workout
//
//  Created by Ally Rilling on 7/29/20.
//

import Foundation
import AudioToolbox

/*
 counting view functions
 */
class CountingLogic {
    /*
     starts timer passed into it
     */
    func startTimer(countingView: CountingView) {
         if countingView.globalVars.timerIsPaused {
             countingView.globalVars.timeRemaining = countingView.globalVars.timeRemaining - 1 // added this so that there is no delay from when the play timer button is pressed
             countingView.globalVars.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
                 if countingView.globalVars.timeRemaining > 0 {
                     countingView.globalVars.timeRemaining = countingView.globalVars.timeRemaining - 1
                 } else {
                    AudioServicesPlayAlertSound(1022);
                     countingView.globalVars.timer?.invalidate()
                 }
             }
             countingView.globalVars.timerIsPaused = false
         }
    }
    
    /*
     stops timer passed into it
     */
    func stopTimer(countingView: CountingView) {
        countingView.globalVars.timerIsPaused = true
        countingView.globalVars.timer?.invalidate()
    }
    
    /*
     resets timer to original value, pauses it
     */
    func resetTimer(countingView: CountingView, globalVars: GlobalVars) {
        countingView.globalVars.timeRemaining = LogicUtilites.returnCorrectExerciseArray(currentType: globalVars.type, globalVars: globalVars)[globalVars.index].amount
        stopTimer(countingView: countingView)
    }
    
    func add15seconds(countingView: CountingView) {
        if countingView.globalVars.timeRemaining == 0 {
            stopTimer(countingView: countingView)
        }
        countingView.globalVars.timeRemaining = countingView.globalVars.timeRemaining + 15
    }
    
    func sub15seconds(countingView: CountingView) {
        if countingView.globalVars.timeRemaining > 15 {
            countingView.globalVars.timeRemaining = countingView.globalVars.timeRemaining - 15
        }
    }
    
//    func setTimer(countingView: CountingView, globalVars: GlobalVars) -> Int {
//        let currentExercise = LogicUtilites.returnCorrectExerciseArray(currentType: countingView.globalVars.type, globalVars: globalVars)[countingView.globalVars.index]
//        countingView.globalVars.timeRemaining = currentExercise.amount
//        return
//    }
    
}
