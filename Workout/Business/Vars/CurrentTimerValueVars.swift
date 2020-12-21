//
//  CurrentTimerValueVars.swift
//  Workout
//
//  Created by Ally Rilling on 8/5/20.
//

import Foundation

/*
 the current timer values that keep track of the states of the timers
 */
class CurrentTimerValueVars: ObservableObject {
    
    @Published var timeRemaining: Int = 0
    @Published var timerIsPaused = true
    @Published var timer: Timer? = nil
    
}
