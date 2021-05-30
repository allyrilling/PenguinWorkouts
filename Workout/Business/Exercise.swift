//
//  Exercise.swift
//  Workout
//
//  Created by Ally Rilling on 8/17/20.
//

import Foundation

struct Exercise: Decodable {
    var name: String
    var amount: Int
    var isTimeBased: Bool
    var startingPosition: String
    var description: String
    var isUserIncluded: Bool = true
    var id: String = UUID().uuidString
    
    init(name: String, amount: Int, isTimeBased: Bool, description: String, startingPosition: String) {
        self.name = name
        self.amount = amount
        self.isTimeBased = isTimeBased
        self.startingPosition = startingPosition
        self.description = description
    }
}
