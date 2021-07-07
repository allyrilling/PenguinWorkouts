//
//  Utilites.swift
//  Workout
//
//  Created by Ally Rilling on 7/23/20.
//

import Foundation
import CoreData

class LogicUtilites {
    
    static func randomizeExercies(globalVars: GlobalVars) { // randomizes exercies on press of randomize button
        globalVars.upperBody.shuffle()
        globalVars.lowerBody.shuffle()
        globalVars.core.shuffle()
        globalVars.hips.shuffle()
    }

    static func returnCorrectExerciseString(globalVars: GlobalVars, currentType: String) -> String { // returns the string of the number of exercieses included in the passed in instance of user configure vars
        if currentType == "Upper Body" {
            return globalVars.amtExUpperBody
        } else if currentType == "Lower Body" {
            return globalVars.amtExLowerBody
        } else if currentType == "Core" {
            return globalVars.amtExCore
        } else if currentType == "Hips" {
            return globalVars.amtExHips
        }
        return "fail" // should never happen
    }
    
    static func returnCorrectExerciseInt(globalVars: GlobalVars) -> Int { // returns the user configured amount of the exercise type specified in parameters
            if globalVars.type == "Upper Body" {
                return Int(globalVars.amtExUpperBody)!
            } else if globalVars.type == "Lower Body" {
                return Int(globalVars.amtExLowerBody)!
            } else if globalVars.type == "Core" {
                return Int(globalVars.amtExCore)!
            } else if globalVars.type == "Hips" {
                return Int(globalVars.amtExHips)!
            }
            return 0 // should never happen
    }
    
    static func updateUserConfigureVars(globalVars: GlobalVars, varToUpdate: String, type: String) { // updates userConfigure vars correct var based on the exercise type passed in
        if type == "Upper Body" {
            globalVars.amtExUpperBody = varToUpdate
        } else if type == "Lower Body" {
            globalVars.amtExLowerBody = varToUpdate
        } else if type == "Core" {
            globalVars.amtExCore = varToUpdate
        } else if type == "Hips" {
            return globalVars.amtExHips = varToUpdate
        }
    }
    
    static func returnCorrectExerciseArray(globalVars: GlobalVars, type: String) -> [Exercise] { // based on the text passed into the function returns the corresponding array
        var returnArray: [Exercise] = []
        if (type == "Upper Body") {
            returnArray = globalVars.upperBody
        } else if (type == "Lower Body") {
            returnArray = globalVars.lowerBody
        } else if (type == "Core") {
            returnArray = globalVars.core
        } else if (type == "Hips") {
            returnArray = globalVars.hips
        }
        return returnArray
    }
    
    static func appendNewExercise(globalVars: GlobalVars, ex: Exercise, type: String) {
        if(type == "Core") {
            globalVars.core.append(ex)
        } else if (type == "Hips") {
            globalVars.hips.append(ex)
        } else if (type == "Upper Body") {
            globalVars.upperBody.append(ex)
        } else if (type == "Lower Body") {
            globalVars.lowerBody.append(ex)
        } else {
            print("failed appendNewExercise")
        }
    }
    
    static func findExercise(globalVars: GlobalVars, ex: Exercise, name: String, amount: Int, isTimeBased: Bool, startingPosition: String, description: String) {
        var index = 0

        if globalVars.type == "Upper Body" {
            while(ex.id != globalVars.upperBody[index].id) {
                index += 1
            }
            globalVars.upperBody[index].name = name
            globalVars.upperBody[index].isTimeBased = isTimeBased
            globalVars.upperBody[index].amount = amount
            globalVars.upperBody[index].startingPosition = startingPosition
            globalVars.upperBody[index].description = description
        } else if globalVars.type == "Lower Body" {
            while(ex.id != globalVars.lowerBody[index].id) {
                index += 1
            }
            globalVars.lowerBody[index].name = name
            globalVars.lowerBody[index].isTimeBased = isTimeBased
            globalVars.lowerBody[index].amount = amount
            globalVars.lowerBody[index].startingPosition = startingPosition
            globalVars.lowerBody[index].description = description

        } else if globalVars.type == "Core" {
            while(ex.id != globalVars.core[index].id) {
                index += 1
            }
            globalVars.core[index].name = name
            globalVars.core[index].isTimeBased = isTimeBased
            globalVars.core[index].amount = amount
            globalVars.core[index].startingPosition = startingPosition
            globalVars.core[index].description = description

        } else if globalVars.type == "Hips" {
            while(ex.id != globalVars.hips[index].id) {
                index += 1
            }
            globalVars.hips[index].name = name
            globalVars.hips[index].isTimeBased = isTimeBased
            globalVars.hips[index].amount = amount
            globalVars.hips[index].startingPosition = startingPosition
            globalVars.hips[index].description = description
        }
    }
    
    static func sortAlphabetically(globalVars: GlobalVars) {
        globalVars.upperBody = globalVars.upperBody.sorted { $0.name < $1.name }
        globalVars.lowerBody = globalVars.lowerBody.sorted { $0.name < $1.name }
        globalVars.core = globalVars.core.sorted { $0.name < $1.name }
        globalVars.hips = globalVars.hips.sorted { $0.name < $1.name }
    }
    
    static func sortAmountAsc(globalVars: GlobalVars) {
        globalVars.upperBody = globalVars.upperBody.sorted { $0.amount < $1.amount }
        globalVars.lowerBody = globalVars.lowerBody.sorted { $0.amount < $1.amount }
        globalVars.core = globalVars.core.sorted { $0.amount < $1.amount }
        globalVars.hips = globalVars.hips.sorted { $0.amount < $1.amount }
    }
    
    static func sortAmountDesc(globalVars: GlobalVars) {
        globalVars.upperBody = globalVars.upperBody.sorted { $0.amount > $1.amount }
        globalVars.lowerBody = globalVars.lowerBody.sorted { $0.amount > $1.amount }
        globalVars.core = globalVars.core.sorted { $0.amount > $1.amount }
        globalVars.hips = globalVars.hips.sorted { $0.amount > $1.amount }
    }
    
    /*static func wrapEx(e: Exercise, context: NSManagedObjectContext) -> ExerciseDB { // converts type Exercise to type ExerciseDB
        let eDB = ExerciseDB(context: context)
        eDB.name = e.name
        eDB.amount = Int64(e.amount)
        eDB.directions = e.description
        eDB.startingPosition = e.startingPosition
        eDB.isTimeBased = e.isTimeBased
        eDB.isUserIncluded = e.isUserIncluded
        return eDB
    }
    
    static func initExGroup(name: String, context: NSManagedObjectContext) -> ExGroup { // used to initalize any new group of exercises
        let newGroup = ExGroup(context: context)
        newGroup.name = "Core"
        newGroup.exercises = []
        return newGroup
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
    }*/
    
}



