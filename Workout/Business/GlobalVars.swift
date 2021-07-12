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
    var defaults: UserDefaults
    
    @Published var groups: [Group] = []
    
    var isFirstLaunch: String
    
    @Published var upperBody: [Exercise] = []
    @Published var lowerBody: [Exercise] = []
    @Published var core: [Exercise] = []
    @Published var hips: [Exercise] = []

    @Published var amtExUpperBody: String
    @Published var amtExLowerBody: String
    @Published var amtExCore: String
    @Published var amtExHips: String
    
    @Published var index = 0
    @Published var type = "Core"
    
    @Published var newExerciseNumber: Int
    
    @Published var timeRemaining = 0
    @Published var timerIsPaused = true
    @Published var timer: Timer? = nil
    
    @Published var reps = 0
    @Published var setsSliderValue: Double = 0.0
    
    @Published var themeName: String
    
    @Published var mainColor: Color
    @Published var subColor: Color
    @Published var accentColor: Color
    
    @Published var bodyTS: CGFloat = 17
    @Published var midTS: CGFloat = 22
    @Published var titleTS: CGFloat = 30
    @Published var bigTitleTS: CGFloat = 50
    
    init() {
        self.defaults = UserDefaults.standard
        
        self.themeName = defaults.string(forKey: DefaultsKeys.themeName.rawValue) ?? ColorThemeNames.oceanSplash.rawValue
        
        self.mainColor = Color(hex: (defaults.object(forKey: DefaultsKeys.theme.rawValue) as? [UInt] ?? [0x05445E, 0x189AB4, 0x75E6DA])![0])
        self.subColor = Color(hex: (defaults.object(forKey: DefaultsKeys.theme.rawValue) as? [UInt] ?? [0x05445E, 0x189AB4, 0x75E6DA])![1])
        self.accentColor = Color(hex: (defaults.object(forKey: DefaultsKeys.theme.rawValue) as? [UInt] ?? [0x05445E, 0x189AB4, 0x75E6DA])![2])
        
        self.amtExCore = defaults.string(forKey: DefaultsKeys.amtExCore.rawValue) ?? "10"
        self.amtExLowerBody = defaults.string(forKey: DefaultsKeys.amtExLowerBody.rawValue) ?? "5"
        self.amtExUpperBody = defaults.string(forKey: DefaultsKeys.amtExUpperBody.rawValue) ?? "5"
        self.amtExHips = defaults.string(forKey: DefaultsKeys.amtExHips.rawValue) ?? "5"
        
        self.type = defaults.string(forKey: DefaultsKeys.type.rawValue) ?? "Core"
        
        self.isFirstLaunch = defaults.string(forKey: DefaultsKeys.isFirstLaunch.rawValue) ?? "true"
        
        self.newExerciseNumber = defaults.integer(forKey: "newExerciseNumber") 
        
        if (isFirstLaunch == "true") {
            print("isfirstlaunch")
            
            Logic()

            self.core = Logic.core
            self.upperBody = Logic.upperBody
            self.lowerBody = Logic.lowerBody
            self.hips = Logic.hips

            self.groups.append(Group(name: "Core", members: self.core, perWorkout: Int(amtExCore)!))
            self.groups.append(Group(name: "Upper Body", members: self.upperBody, perWorkout: Int(amtExUpperBody)!))
            self.groups.append(Group(name: "Lower Body", members: self.lowerBody, perWorkout: Int(amtExLowerBody)!))
            self.groups.append(Group(name: "Hips", members: self.hips, perWorkout: Int(amtExHips)!))
            
            encodeGroups(groups: groups)
            
            defaults.set("false", forKey: DefaultsKeys.isFirstLaunch.rawValue)
            
        } else {
            print("isNOTfirstlaunch")
            
            decodeGroups()
            
        }
    }
    
    func encodeGroups(groups: [Group]) {
        let encoder = JSONEncoder()
        
        if let encodedGroups = try? encoder.encode(groups) {
            defaults.set(encodedGroups, forKey: DefaultsKeys.groups.rawValue)
        }
        
    }
    
    func decodeGroups() {
        if let savedGroups = defaults.object(forKey: DefaultsKeys.groups.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let decodedGroups = try? decoder.decode([Group].self, from: savedGroups) {
                core = decodedGroups[0].members
                upperBody = decodedGroups[1].members
                lowerBody = decodedGroups[2].members
                hips = decodedGroups[3].members
                groups = [Group(name: "Core", members: core, perWorkout: Int(amtExCore)!), Group(name: "Upper Body", members: upperBody, perWorkout: Int(amtExUpperBody)!), Group(name: "Lower Body", members: lowerBody, perWorkout: Int(amtExLowerBody)!), Group(name: "Hips", members: hips, perWorkout: Int(amtExHips)!)]
            }
        }
        
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
