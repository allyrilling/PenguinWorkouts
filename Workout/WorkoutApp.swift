//
//  WorkoutApp.swift
//  Workout
//
//  Created by Ally Rilling on 7/21/20.
//

import SwiftUI

@main
struct WorkoutApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            let globalVars = GlobalVars(context: persistenceController.container.viewContext)
            MainView(globalVars: globalVars)
        }
    }
}


/*
 not sure if i need to add the persistant container
 and savefunction
 supposed to put it in app delegate
 but i dont have a delagate
 */
