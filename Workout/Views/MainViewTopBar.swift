//
//  MainViewTopBar.swift
//  Workout
//
//  Created by Ally Rilling on 7/28/20.
//

import SwiftUI

struct MainViewTopBar: View {
    @ObservedObject var globalVars: GlobalVars
    @State var configureIsActive = false
    
    var body: some View {
        
        HStack {
            Menu(content: { // sort menu
                Button(action: {
                    globalVars.type = "Core"
                    globalVars.defaults.set("Core", forKey: DefaultsKeys.type.rawValue)
                }, label: {
                    Text("Core")
                })
                Button(action: {
                    globalVars.type = "Upper Body"
                    globalVars.defaults.set("Upper Body", forKey: DefaultsKeys.type.rawValue)
                }, label: {
                    Text("Upper Body")
                })
                Button(action: {
                    globalVars.type = "Lower Body"
                    globalVars.defaults.set("Lower Body", forKey: DefaultsKeys.type.rawValue)
                }, label: {
                    Text("Lower Body")
                })
                Button(action: {
                    globalVars.type = "Hips"
                    globalVars.defaults.set("Hips", forKey: DefaultsKeys.type.rawValue)
                }, label: {
                    Text("Hips")
                })
            }, label: {
                HStack {
                    Text(globalVars.type)
                        .font(.system(size: globalVars.bigTitleTS, weight: .bold))
                    Image(systemName: "chevron.down")
                        .font(.system(size: globalVars.midTS))
                }
            })
            
            Spacer()
            
            Button(action: { // randomize button
                LogicUtilites.randomizeExercies(globalVars: globalVars)
            }, label: {
                Image(systemName: "shuffle")
                    .font(.system(size: globalVars.midTS))
                    .padding()
            }).buttonStyle(SnazzyBS(globalVars: globalVars))
            
            Spacer()
            
            Button(action: { // configure button
                configureIsActive.toggle()
            }, label: {
                Image(systemName: "gear")
                    .font(.system(size: globalVars.midTS))
                    .padding()
            }).sheet(isPresented: $configureIsActive) {
                ConfigureView(globalVars: globalVars, configureIsActive: $configureIsActive)
            }.buttonStyle(SnazzyBS(globalVars: globalVars))
            
        }.padding()
    }
}

