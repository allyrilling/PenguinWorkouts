//
//  Utilites.swift
//  Workout
//
//  Created by Ally Rilling on 7/23/20.
//

import Foundation

class LogicUtilites {
    
    static func randomizeExercies(globalVars: GlobalVars) { // randomizes exercies on press of randomize button
        globalVars.upperBody.shuffle()
        globalVars.lowerBody.shuffle()
        globalVars.core.shuffle()
        globalVars.hips.shuffle()
    }

    static func returnCorrectExerciseString(currentType: String, globalVars: GlobalVars) -> String { // returns the string of the number of exercieses included in the passed in instance of user configure vars
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
    
    static func returnCorrectExerciseInt(currentType: String, globalVars: GlobalVars) -> Int { // returns the user configured amount of the exercise type specified in parameters
            if currentType == "Upper Body" {
                return Int(globalVars.amtExUpperBody)!
            } else if currentType == "Lower Body" {
                return Int(globalVars.amtExLowerBody)!
            } else if currentType == "Core" {
                return Int(globalVars.amtExCore)!
            } else if currentType == "Hips" {
                return Int(globalVars.amtExHips)!
            }
            return 0 // should never happen
    }
    
    static func updateUserConfigureVars(exerciseType: String, globalVars: GlobalVars, varToUpdate: String) { // updates userConfigure vars correct var based on the exercise type passed in
        if exerciseType == "Upper Body" {
            globalVars.amtExUpperBody = varToUpdate
        } else if exerciseType == "Lower Body" {
            globalVars.amtExLowerBody = varToUpdate
        } else if exerciseType == "Core" {
            globalVars.amtExCore = varToUpdate
        } else if exerciseType == "Hips" {
            return globalVars.amtExHips = varToUpdate
        }
    }
    
    static func returnCorrectExerciseArray(currentType: String, globalVars: GlobalVars) -> [Exercise] { // based on the text passed into the function returns the corresponding array
        var returnArray: [Exercise] = []
        if currentType == "Upper Body" {
            returnArray = globalVars.upperBody
        } else if currentType == "Lower Body" {
            returnArray = globalVars.lowerBody
        } else if currentType == "Core" {
            returnArray = globalVars.core
        } else if currentType == "Hips" {
            returnArray = globalVars.hips
        }
        return returnArray
    }
    
    static func appendNewExercise(currentType: String, globalVars: GlobalVars, ex: Exercise) {
        if(currentType == "Core") {
            globalVars.core.append(ex)
        } else if (currentType == "Hips") {
            globalVars.hips.append(ex)
        } else if (currentType == "Upper Body") {
            globalVars.upperBody.append(ex)
        } else if (currentType == "Lower Body") {
            globalVars.lowerBody.append(ex)
        } else {
            print("failed appendNewExercise")
        }
    }
    
    static func findExercise(currentType: String, globalVars: GlobalVars, ex: Exercise, name: String, amount: Int, isTimeBased: Bool, startingPosition: String, description: String) {
        var index = 0

        if currentType == "Upper Body" {
            while(ex.id != globalVars.upperBody[index].id) {
                index += 1
            }
            globalVars.upperBody[index].name = name
            globalVars.upperBody[index].isTimeBased = isTimeBased
            globalVars.upperBody[index].amount = amount
            globalVars.upperBody[index].startingPosition = startingPosition
            globalVars.upperBody[index].description = description
        } else if currentType == "Lower Body" {
            while(ex.id != globalVars.lowerBody[index].id) {
                index += 1
            }
            globalVars.lowerBody[index].name = name
            globalVars.lowerBody[index].isTimeBased = isTimeBased
            globalVars.lowerBody[index].amount = amount
            globalVars.lowerBody[index].startingPosition = startingPosition
            globalVars.lowerBody[index].description = description

        } else if currentType == "Core" {
            while(ex.id != globalVars.core[index].id) {
                index += 1
            }
            globalVars.core[index].name = name
            globalVars.core[index].isTimeBased = isTimeBased
            globalVars.core[index].amount = amount
            globalVars.core[index].startingPosition = startingPosition
            globalVars.core[index].description = description

        } else if currentType == "Hips" {
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
    
    static func removeExercise(currentType: String, globalVars: GlobalVars, ex: Exercise) {
        var index = 0

        if currentType == "Upper Body" {
            while(ex.id != globalVars.upperBody[index].id) {
                index += 1
            }
            globalVars.upperBody.remove(at: index)
        } else if currentType == "Lower Body" {
            while(ex.id != globalVars.lowerBody[index].id) {
                index += 1
            }
            globalVars.lowerBody.remove(at: index)
        } else if currentType == "Core" {
            while(ex.id != globalVars.core[index].id) {
                index += 1
            }
            globalVars.core.remove(at: index)

        } else if currentType == "Hips" {
            while(ex.id != globalVars.hips[index].id) {
                index += 1
            }
            globalVars.hips.remove(at: index)
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
    
}

