//
//  UserConfigureVars.swift
//  Workout
//
//  Created by Ally Rilling on 7/28/20.
//

import Foundation

/*
 this class is used to pass the amount of exercies per type entered by the user back to the content view
 */
class UserConfigureVars: ObservableObject {
    @Published var amtExUpperBody: String = "5"
    @Published var amtExLowerBody: String = "5"
    @Published var amtExCore: String = "10"
    //FIXME: - hips
    @Published var amtExHips: String = "5"
}
