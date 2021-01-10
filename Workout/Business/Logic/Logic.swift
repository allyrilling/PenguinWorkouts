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
class Logic {
    /*
     arrays of the exercise objects, constant throughtout the app
     */
    static var upperBody: [Exercise] = []
    static var lowerBody: [Exercise] = []
    static var core: [Exercise] = []
    static var hips: [Exercise] = []
    
    /*
     populates the class arrays above with the contents of the json files using the fucntion decodeJSON
     */
    init() {
        Logic.upperBody = Logic.decodeJSON(jsonFileName: "UpperBody").shuffled()
        Logic.lowerBody = Logic.decodeJSON(jsonFileName: "LowerBody").shuffled()
        Logic.core = Logic.decodeJSON(jsonFileName: "Core").shuffled()
        Logic.hips = Logic.decodeJSON(jsonFileName: "Hips").shuffled()
    }
    
    /*
     decodes local json files into exercise objects to populate the above arrays
     */
    static func decodeJSON(jsonFileName: String) -> [Exercise] {
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
