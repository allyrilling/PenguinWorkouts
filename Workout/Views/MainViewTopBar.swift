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
            Button(action: { // randomize button
                LogicUtilites.randomizeExercies(globalVars: globalVars)
            }, label: {
                HStack {
                    Image(systemName: "shuffle")
                    Text("Randomize")
                }.foregroundColor(.accentColor)
                .padding()
            }).buttonStyle(NeuButtonStyle(isRoundRect: true))
            
            Spacer()
            
            Button(action: { // configure button
                configureIsActive.toggle()
            }, label: {
                HStack {
                    Image(systemName: "gear")
                    Text("Configure")
                }.foregroundColor(.accentColor)
                .padding()
            }).buttonStyle(NeuButtonStyle(isRoundRect: true))
            .sheet(isPresented: $configureIsActive) {
                ConfigureView(globalVars: globalVars, configureIsActive: $configureIsActive)
            }
        }.padding()
    }
}
