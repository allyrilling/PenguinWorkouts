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
    static func randomizeExercies(logic: Logic) {
        logic.upperBody.shuffle()
        logic.lowerBody.shuffle()
        logic.core.shuffle()
        //FIXME: - hips
        logic.hips.shuffle()
    }

    /*
     returns the string of the number of exercieses included in the passed in instance of user configure vars
     */
    static func returnCorrectExerciseString(currentType: String, userConfigureVars: UserConfigureVars) -> String {
        if currentType == "Upper Body" {
            return userConfigureVars.amtExUpperBody
        } else if currentType == "Lower Body" {
            return userConfigureVars.amtExLowerBody
        } else if currentType == "Core" {
            return userConfigureVars.amtExCore
        }
        //FIXME: - hips
        else if currentType == "Hips" {
            return userConfigureVars.amtExHips
        }
        return "fail" // should never happen
    }
    
    /*
     returns the user configured amount of the exercise type specified in parameters
     */
    static func returnCorrectExerciseInt(currentType: String, userConfigureVars: UserConfigureVars) -> Int {
            if currentType == "Upper Body" {
                return Int(userConfigureVars.amtExUpperBody)!
            } else if currentType == "Lower Body" {
                return Int(userConfigureVars.amtExLowerBody)!
            } else if currentType == "Core" {
                return Int(userConfigureVars.amtExCore)!
            }
        //FIXME: - hips
            else if currentType == "Hips" {
                return Int(userConfigureVars.amtExHips)!
            }
            return 0
    }
    
    /*
     updates userConfigure vars correct var based on the exercise type passed in
     */
    static func updateUserConfigureVars(exerciseType: String, userConfigureVars: UserConfigureVars, varToUpdate: String) {
        if exerciseType == "Upper Body" {
            userConfigureVars.amtExUpperBody = varToUpdate
        } else if exerciseType == "Lower Body" {
            userConfigureVars.amtExLowerBody = varToUpdate
        } else if exerciseType == "Core" {
            userConfigureVars.amtExCore = varToUpdate
        }
        //FIXME: - hips
        else if exerciseType == "Hips" {
            return userConfigureVars.amtExHips = varToUpdate
        }
    }
    
}

