//
//  CurrentExerciseVars.swift
//  Workout
//
//  Created by Ally Rilling on 7/31/20.
//

import Foundation

/*
 the global instance of index and type
 */
class CurrentExerciseVars: ObservableObject {
    @Published var currentExerciseIndex = 0
    @Published var currentExerciseType = "Core"
}
