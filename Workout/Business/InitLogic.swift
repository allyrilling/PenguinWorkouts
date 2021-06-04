//
//  Utilities.swift
//  Workout
//
//  Created by Ally Rilling on 6/4/21.
//

import Foundation
import CoreData

class InitLogic {
    
    static func decodeJSON(jsonFileName: String, context: NSManagedObjectContext) -> [ExerciseDB] { // decodes local json files into exercise objects to populate the above arrays
        var rawExArray: [Exercise] = []
        var wrappedExArray: [ExerciseDB] = []
        
        if let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                rawExArray = try decoder.decode(Array<Exercise>.self, from: data)
            } catch {
                print("error:\(error)")
            }
        }
        
        for ex in rawExArray {
            wrappedExArray.append(wrapEx(e: ex, context: context))
        }
        
        return wrappedExArray
    }
    
    static func exInit(context: NSManagedObjectContext, exStore: ExStore) { // initializes stock exercises and stock categories, THE ONLY FUNCTION THAT NEEDS TO BE CALLED BY GLOBALVARS
        let coreGroup = initExGroup(name: "Core", context: context)
        coreGroup.exercises = decodeJSON(jsonFileName: "Core", context: context)
        exStore.main?.append(coreGroup)
        
        let ubGroup = initExGroup(name: "Upper Body", context: context)
        ubGroup.exercises = decodeJSON(jsonFileName: "Upper Body", context: context)
        exStore.main?.append(ubGroup)
        
        let lbGroup = initExGroup(name: "Lower Body", context: context)
        lbGroup.exercises = decodeJSON(jsonFileName: "Lower Body", context: context)
        exStore.main?.append(lbGroup)
        
        let hipsGroup = initExGroup(name: "Hips", context: context)
        hipsGroup.exercises = decodeJSON(jsonFileName: "Hips", context: context)
        exStore.main?.append(hipsGroup)
    }
    
    static func initExGroup(name: String, context: NSManagedObjectContext) -> ExGroup { // used to initalize any new group of exercises
        let newGroup = ExGroup(context: context)
        newGroup.name = name
        newGroup.exercises = []
        newGroup.amountPerWorkout = 10
        return newGroup
    }
    
    static func wrapEx(e: Exercise, context: NSManagedObjectContext) -> ExerciseDB { // converts type Exercise to type ExerciseDB
        let eDB = ExerciseDB(context: context)
        eDB.name = e.name
        eDB.amount = Int64(e.amount)
        eDB.directions = e.description
        eDB.startingPosition = e.startingPosition
        eDB.isTimeBased = e.isTimeBased
        eDB.isUserIncluded = e.isUserIncluded
        return eDB
    }
    
}
