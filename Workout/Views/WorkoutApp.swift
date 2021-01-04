//
//  WorkoutApp.swift
//  Workout
//
//  Created by Ally Rilling on 7/21/20.
//

import SwiftUI

@main
struct WorkoutApp: App {
    var body: some Scene {
        WindowGroup {
            /*
             global vars
             */
            let globalUserConfigureVars = UserConfigureVars()
            let globalLogic = Logic()
            let globalLogicUtilites = LogicUtilites()
            let globalCurrentExerciseVars = CurrentExerciseVars()
            let appState = AppState()
      
            let globalMotherView = MotherView(
                viewState: ViewKeys.mainViewState.rawValue,
                currentExerciseVars: globalCurrentExerciseVars,
                userConfigureVars: globalUserConfigureVars,
                logic: globalLogic,
                logicUtilites: globalLogicUtilites,
                appState: appState
            )

            globalMotherView
            
        }
    }
}
