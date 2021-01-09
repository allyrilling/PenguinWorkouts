//
//  MainViewTopBar.swift
//  Workout
//
//  Created by Ally Rilling on 7/28/20.
//

import SwiftUI

/*
 the bar housing the randomize and configure buttons
 */
struct MainViewTopBar: View {
    @ObservedObject var logic: Logic
    @State var motherView: MotherView
    
    @State var configureIsActive = false
    
    /*
     current type is so that when navigating back to main view the type the user had selected before is still selected after
     */
    var currentType: String
    
    var body: some View {
        HStack {
            Button(action: { // randomize button
                LogicUtilites.randomizeExercies(logic: logic)
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
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
            
            Button(action: {
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
                ConfigureView(motherView: motherView, configureIsActive: $configureIsActive, userConfigureVars: motherView.userConfigureVars)
            }
            
//            NavigationLink(
//                destination: ConfigureView(motherView: motherView, userConfigureVars: motherView.userConfigureVars),
//                label: {
//                    HStack {
//                        Image(systemName: "gear")
//                        Text("Configure")
//                    }.foregroundColor(.accentColor)
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 15)
//                                    .foregroundColor(Color("BackgroundColor"))
//                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
//                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
//                    .padding()
//                })
        }
    }
}
