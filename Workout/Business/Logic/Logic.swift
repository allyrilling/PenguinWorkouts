//
//  Logic.swift
//  Workout
//
//  Created by Ally Rilling on 7/21/20.
//

import Foundation

/*
 master logic class
 */
class Logic: ObservableObject {
    /*
     arrays of the exercise objects, constant throughtout the app
     */
    @Published var upperBody: [Exercise] = []
    @Published var lowerBody: [Exercise] = []
    @Published var core: [Exercise] = []
    @Published var hips: [Exercise] = []
    
    /*
     populates the class arrays above with the contents of the json files using the fucntion decodeJSON
     */
    init() {
        upperBody = decodeJSON(jsonFileName: "UpperBody").shuffled()
        lowerBody = decodeJSON(jsonFileName: "LowerBody").shuffled()
        core = decodeJSON(jsonFileName: "Core").shuffled()
        hips = decodeJSON(jsonFileName: "Hips").shuffled()
    }
    
    /*
     based on the text passed into the function returns the corresponding array
     */
    func returnCorrectExerciseArray(currentType: String) -> [Exercise] {
        var returnArray: [Exercise] = []
        if currentType == "Upper Body" {
            returnArray = upperBody
        } else if currentType == "Lower Body" {
            returnArray = lowerBody
        } else if currentType == "Core" {
            returnArray = core
        } else if currentType == "Hips" {
            returnArray = hips
        }
        return returnArray
    }
    
    /*
     decodes local json files into exercise objects to populate the above arrays
     */
    func decodeJSON(jsonFileName: String) -> [Exercise] {
        var arrayToInit: [Exercise] = []
        
        if let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                arrayToInit = try decoder.decode(Array<Exercise>.self, from: data)
            } catch {
                print("error:\(error)")
            }
        }
        
        return arrayToInit
    }
    
}
