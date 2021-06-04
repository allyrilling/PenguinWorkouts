//
//  ArraySortingLogic.swift
//  Workout
//
//  Created by Ally Rilling on 6/4/21.
//

import Foundation

class ArraySortingLogic {
    
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
