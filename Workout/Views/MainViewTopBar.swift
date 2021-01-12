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
            }) {
                    HStack {
                        Image(systemName: "shuffle")
                        Text("Randomize")
                    }.foregroundColor(.accentColor)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BackgroundColor"))
                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    .padding()
            }
            
            Spacer()
            
            Button(action: { // configure button
                configureIsActive.toggle()
            }, label: {
                HStack {
                    Image(systemName: "gear")
                    Text("Configure")
                }.foregroundColor(.accentColor)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("BackgroundColor"))
                                .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                .padding()
            }).sheet(isPresented: $configureIsActive) {
                ConfigureView(globalVars: globalVars, configureIsActive: $configureIsActive)
            }
        }
    }
}
