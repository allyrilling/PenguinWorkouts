//
//  MotherView.swift
//  Workout
//
//  Created by Ally Rilling  7/27/20.
//

import SwiftUI

/*
 the view that houses the main and configure views, displays the one based on the state
 */
struct MotherView: View { 
    /*
     the state: mainview, configure view, detail view
     */
    @State var viewState: String
    /*
     current exercise index and type
     */
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    /*
     the amount of each exercise type the user has chosen
     */
    @ObservedObject var userConfigureVars: UserConfigureVars
    /*
     the instance of logic used in all app
     */
    @ObservedObject var logic: Logic
    /*
     the instance of logic utilites used in all app
     */
    var logicUtilites: LogicUtilites
    
    @State var appState: AppState
    
    var body: some View {
        
        NavigationView {
            /*
             determines the correct view to display based on the viewState global var
             */
            VStack {
                if viewState == ViewKeys.mainViewState.rawValue {
                    MainView(motherView: self,
                             currentType: currentExerciseVars.currentExerciseType,
                             currentExerciseVars: currentExerciseVars,
                             userConfigureVars: userConfigureVars,
                             logic: logic,
                             logicUtilites: logicUtilites)
                }
                
                
                else if viewState == ViewKeys.configureViewState.rawValue {
//                    ConfigureView(motherView: self,
//                                  userConfigureVars: userConfigureVars)
                }
                
                
                else if viewState == ViewKeys.detailViewState.rawValue {
//                    DetailView(motherView: self,
//                               currentExerciseVars: currentExerciseVars,
//                               logic: logic,
//                               userConfigureVars: userConfigureVars,
//                               appState: appState,
//                               rootIsActive: false)
                } else if viewState == ViewKeys.detailViewState2.rawValue {
                    // have two detail view view states so that the view refreshes when you go to the next view
//                    DetailView(motherView: self,
//                               currentExerciseVars: currentExerciseVars,
//                               logic: logic,
//                               userConfigureVars: userConfigureVars,
//                               appState: appState,
//                               rootIsActive: false)
                }
            }.navigationBarHidden(true)
        
        }
        
    }
}

