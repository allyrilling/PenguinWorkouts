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
    
}

