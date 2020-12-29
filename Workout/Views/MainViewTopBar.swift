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
                        .foregroundColor(.black)
                        .background(Circle().foregroundColor(.accentColor).frame(width: 40, height: 40))
                    Text("Randomize")
                        .foregroundColor(.black)
                        .padding(.leading)
                }.padding(20)
            }
            
            Spacer()
            
            Button(action: { // configure button
                motherView.currentExerciseVars.currentExerciseType = currentType
                motherView.viewState = ViewKeys.configureViewState.rawValue
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }) {
                HStack {
                    Text("Configure")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    Image(systemName: "gear")
                        .foregroundColor(.black)
                        .background(Circle().foregroundColor(.accentColor).frame(width: 40, height: 40))
                }.padding(20)
            }
        }
    }
}
