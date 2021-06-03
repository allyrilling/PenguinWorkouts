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
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            let globalVars = GlobalVars(context: persistenceController.container.viewContext)
            MainView(globalVars: globalVars)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}


/*
 not sure if i need to add the persistant container
 and savefunction
 supposed to put it in app delegate
 but i dont have a delagate
 */
