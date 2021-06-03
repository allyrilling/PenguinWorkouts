//
//  GlobalVars.swift
//  Workout
//
//  Created by Ally Rilling on 1/9/21.
//

import Foundation
import SwiftUI
import CoreData

class GlobalVars: ObservableObject {
    var context: NSManagedObjectContext
    var col: Collections
    
    @Published var upperBody: [Exercise] = []
    @Published var lowerBody: [Exercise] = []
    @Published var core: [Exercise] = []
    @Published var hips: [Exercise] = []

    @Published var amtExUpperBody: String = "5"
    @Published var amtExLowerBody: String = "5"
    @Published var amtExCore: String = "10"
    @Published var amtExHips: String = "5"
    
    @Published var index = 0
    @Published var type = "Core"
    
    @Published var timeRemaining = 0
    @Published var timerIsPaused = true
    @Published var timer: Timer? = nil
    
    @Published var reps = 0
    @Published var setsSliderValue: Double = 0.0
    
    @Published var mainColor = Color(hex: UInt(ColorThemes.summerSplash[0]))
    @Published var subColor = Color(hex: UInt(ColorThemes.summerSplash[1]))
    @Published var accentColor = Color(hex: UInt(ColorThemes.summerSplash[2]))
    
    @Published var bodyTS: CGFloat = 17
    @Published var midTS: CGFloat = 22
    @Published var titleTS: CGFloat = 30
    @Published var bigTitleTS: CGFloat = 50
    
    init(context: NSManagedObjectContext) {
        Logic()
//        self.core = Logic.core
//        self.upperBody = Logic.upperBody
//        self.lowerBody = Logic.lowerBody
//        self.hips = Logic.hips
        
        self.context = context
        self.col = Collections(context: context)
        
        col.core = []
        for i in 0..<Logic.core.count {
            let eDB = LogicUtilites.wrapEx(e: Logic.core[i], context: context)
            col.core?.append(eDB)
        }
        
        col.upperBody = []
        for i in 0..<Logic.upperBody.count {
            let eDB = LogicUtilites.wrapEx(e: Logic.upperBody[i], context: context)
            col.upperBody?.append(eDB)
        }
        
        col.lowerBody = []
        for i in 0..<Logic.lowerBody.count {
            let eDB = LogicUtilites.wrapEx(e: Logic.lowerBody[i], context: context)
            col.lowerBody?.append(eDB)
        }
        
        col.hips = []
        for i in 0..<Logic.hips.count {
            let eDB = LogicUtilites.wrapEx(e: Logic.hips[i], context: context)
            col.hips?.append(eDB)
        }
        
        self.core = Logic.core
        self.upperBody = Logic.upperBody
        self.lowerBody = Logic.lowerBody
        self.hips = Logic.hips
        
    }
    
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
