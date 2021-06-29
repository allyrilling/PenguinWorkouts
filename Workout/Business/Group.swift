//
//  Group.swift
//  Workout
//
//  Created by Ally Rilling on 6/20/21.
//

import Foundation

struct Group: Codable {
    
    var members: [Exercise]
    var perWorkout: Int
    
}
