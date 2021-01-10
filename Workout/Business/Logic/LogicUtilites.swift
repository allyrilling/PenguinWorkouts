//
//  Utilites.swift
//  Workout
//
//  Created by Ally Rilling on 7/23/20.
//

import Foundation

/*
 random logic utilties, doesnt require class to be instantiated as they are all static functions
 */
class LogicUtilites {
    
    /*
     randomizes exercies on press of randomize button
     */
    static func randomizeExercies(globalVars: GlobalVars) {
        globalVars.upperBody.shuffle()
        globalVars.lowerBody.shuffle()
        globalVars.core.shuffle()
        globalVars.hips.shuffle()
    }

    /*
     returns the string of the number of exercieses included in the passed in instance of user configure vars
     */
    static func returnCorrectExerciseString(currentType: String, globalVars: GlobalVars) -> String {
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
    
    /*
     returns the user configured amount of the exercise type specified in parameters
     */
    static func returnCorrectExerciseInt(currentType: String, globalVars: GlobalVars) -> Int {
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
    
    /*
     updates userConfigure vars correct var based on the exercise type passed in
     */
    static func updateUserConfigureVars(exerciseType: String, globalVars: GlobalVars, varToUpdate: String) {
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
    
    /*
     based on the text passed into the function returns the corresponding array
     */
    static func returnCorrectExerciseArray(currentType: String, globalVars: GlobalVars) -> [Exercise] {
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

