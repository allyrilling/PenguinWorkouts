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
            let globalVars = GlobalVars()
            MainView(globalVars: globalVars)
        }
    }
}
