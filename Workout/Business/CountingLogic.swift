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
    
    static func startTimer(globalVars: GlobalVars) { //starts timer passed into it
         if globalVars.timerIsPaused {
             globalVars.timeRemaining = globalVars.timeRemaining - 1 // added this so that there is no delay from when the play timer button is pressed
             globalVars.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
                 if globalVars.timeRemaining > 0 {
                     globalVars.timeRemaining = globalVars.timeRemaining - 1
                 } else {
                    AudioServicesPlayAlertSound(1022);
                     globalVars.timer?.invalidate()
                 }
             }
             globalVars.timerIsPaused = false
         }
    }
    
    static func stopTimer(globalVars: GlobalVars) { // stops timer passed into it
        globalVars.timerIsPaused = true
        globalVars.timer?.invalidate()
    }
    
    static func resetTimer(globalVars: GlobalVars) { // resets timer to original value, pauses it
        globalVars.timeRemaining = LogicUtilites.returnCorrectExerciseArray(currentType: globalVars.type, globalVars: globalVars)[globalVars.index].amount
        stopTimer(globalVars: globalVars)
    }
    
    static func add15seconds(globalVars: GlobalVars) {
        if globalVars.timeRemaining == 0 {
            stopTimer(globalVars: globalVars)
        }
        globalVars.timeRemaining = globalVars.timeRemaining + 15
    }
    
    static func sub15seconds(globalVars: GlobalVars) {
        if globalVars.timeRemaining > 15 {
            globalVars.timeRemaining = globalVars.timeRemaining - 15
        }
    }
    
}
