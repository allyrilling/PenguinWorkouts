//
//  GlobalVars.swift
//  Workout
//
//  Created by Ally Rilling on 1/9/21.
//

import Foundation
import SwiftUI

class GlobalVars: ObservableObject {
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
    
    @Published var accentColor = Color.red
    @Published var secondaryColor = Color.gray.opacity(0.2)
    
    @Published var bodyTS: CGFloat = 17
    @Published var titleTS: CGFloat = 30
    @Published var bigTitleTS: CGFloat = 50
    
    init() {
        Logic()
        self.core = Logic.core
        self.upperBody = Logic.upperBody
        self.lowerBody = Logic.lowerBody
        self.hips = Logic.hips
    }
    
}
