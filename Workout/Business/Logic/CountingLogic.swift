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
     gets the state of the set button passed into it
     isselected = true which means that set is complete
     */
    func returnCorrectIsSelectedVar(setButtonSelectionVars: SetButtonSelectionVars, setNumber: Int) -> Bool {
        if setNumber == 1 {
            return setButtonSelectionVars.isSelected1
        } else if setNumber == 2 {
            return setButtonSelectionVars.isSelected2
        } else if setNumber == 3 {
            return setButtonSelectionVars.isSelected3
        }
        return false
    }
    
    /*
     toggle setbutton on tap
     */
    func toggleSetButtonSelection(isSelected: Bool) -> Bool {
        if isSelected {
            return false
        } else {
            return true
        }
    }
    
    /*
     starts timer passed into it
     */
    func startTimer(countingView: CountingView) {
         if countingView.timerIsPaused {
             countingView.timeRemaining = countingView.timeRemaining - 1 // added this so that there is no delay from when the play timer button is pressed
             countingView.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
                 if countingView.timeRemaining > 0 {
                     countingView.timeRemaining = countingView.timeRemaining - 1
                 } else {
                    AudioServicesPlayAlertSound(1022);
                     countingView.timer?.invalidate()
                 }
             }
             countingView.timerIsPaused = false
         }
    }
    
    /*
     stops timer passed into it
     */
    func stopTimer(countingView: CountingView) {
        countingView.timerIsPaused = true
        countingView.timer?.invalidate()
    }
    
    /*
     resets timer to original value, pauses it
     */
    func resetTimer(countingView: CountingView, globalVars: GlobalVars) {
        countingView.timeRemaining = LogicUtilites.returnCorrectExerciseArray(currentType: countingView.globalVars.type, globalVars: globalVars)[countingView.globalVars.index].amount
        stopTimer(countingView: countingView)
    }
    
    func add15seconds(countingView: CountingView) {
        if countingView.timeRemaining == 0 {
            stopTimer(countingView: countingView)
        }
        countingView.timeRemaining = countingView.timeRemaining + 15
    }
    
    func sub15seconds(countingView: CountingView) {
        countingView.timeRemaining = countingView.timeRemaining - 15
    }
    
    func add1ToReps() {
        
    }
    
}
