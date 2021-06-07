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
    var exStore: ExStore
    
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
        // new stuff, not yet doing anytihng
        self.context = context
        self.exStore = ExStore(context: context)
        exStore.main = []
        
//        InitLogic.exInit(context: context, exStore: exStore)
        
        // i think it would be ideal to not have any @published arrays, and read from only the database, ie not have that middle layer
        // however,i am not entirly sure how to do that without having a shit ton of optionals and force unwrapping which ik is bad
        // i think there should be a way to read the json directly into the core data store, and from there make all changes and updates directly do the core data store (ie have no intermediate arrays) i just dont know how to do that rn
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
