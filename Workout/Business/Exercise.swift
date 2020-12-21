//
//  Exercise.swift
//  Workout
//
//  Created by Ally Rilling on 8/17/20.
//

import Foundation

/*
 an exercise
 includes various elements that each exercise contatains
 */
struct Exercise: Decodable {
    var name: String
    var amount: Int
    var isTimeBased: Bool
//    var videoURL: String
    // FIXME: - text
    var startingPosition: String
    var description: String
    
    init(name: String, amount: Int, isTimeBased: Bool, description: String, startingPosition: String) {
        self.name = name
        self.amount = amount
        self.isTimeBased = isTimeBased
//        self.videoURL = description
        //FIXME: - text
        self.startingPosition = startingPosition
        self.description = description
    }
}
