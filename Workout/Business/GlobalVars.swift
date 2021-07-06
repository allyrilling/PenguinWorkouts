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
        
        self.themeName = defaults.string(forKey: "themeName") ?? ColorThemeNames.oceanSplash.rawValue
        
        self.mainColor = Color(hex: (defaults.object(forKey: "theme") as? [UInt] ?? [0x05445E, 0x189AB4, 0x75E6DA])![0])
        self.subColor = Color(hex: (defaults.object(forKey: "theme") as? [UInt] ?? [0x05445E, 0x189AB4, 0x75E6DA])![1])
        self.accentColor = Color(hex: (defaults.object(forKey: "theme") as? [UInt] ?? [0x05445E, 0x189AB4, 0x75E6DA])![2])
        
        self.amtExCore = defaults.string(forKey: "amtExCore") ?? "10"
        self.amtExLowerBody = defaults.string(forKey: "amtExLowerBody") ?? "5"
        self.amtExUpperBody = defaults.string(forKey: "amtExUpperBody") ?? "5"
        self.amtExHips = defaults.string(forKey: "amtExHips") ?? "5"
        
        self.type = defaults.string(forKey: "type") ?? "Core"
        
        self.isFirstLaunch = defaults.string(forKey: "isFirstLaunch") ?? "true"
        
        if (isFirstLaunch == "true") {
            print("isfirstlaunch")
            
            Logic()

            self.core = Logic.core
            self.upperBody = Logic.upperBody
            self.lowerBody = Logic.lowerBody
            self.hips = Logic.hips

            self.groups.append(Group(members: self.core, perWorkout: self.core.count))
            self.groups.append(Group(members: self.upperBody, perWorkout: self.upperBody.count))
            self.groups.append(Group(members: self.lowerBody, perWorkout: self.lowerBody.count))
            self.groups.append(Group(members: self.hips, perWorkout: self.hips.count))
            
            encodeGroups(groups: groups)
            
            defaults.set("false", forKey: "isFirstLaunch")
            
        } else {
            print("isNOTfirstlaunch")
            
            decodeGroups()
            
        }
        
        
        
    }
    
    func encodeGroups(groups: [Group]) {
        let encoder = JSONEncoder()
        
        if let encodedGroups = try? encoder.encode(groups) {
            defaults.set(encodedGroups, forKey: "groups")
        }
        
    }
    
    func decodeGroups() {
        if let savedGroups = defaults.object(forKey: "groups") as? Data {
            let decoder = JSONDecoder()
            if let decodedGroups = try? decoder.decode([Group].self, from: savedGroups) {
                core = decodedGroups[0].members
                upperBody = decodedGroups[1].members
                lowerBody = decodedGroups[2].members
                hips = decodedGroups[3].members
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
