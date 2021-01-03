//
//  DetailView.swift
//  Workout
//
//  Created by Ally Rilling on 7/31/20.
//

import SwiftUI

/*
 the view that has the specific exercise and its sets and reps where applicable
 */
struct DetailView: View {
    /*
     see mother view for var descriptions
     */
    @State var motherView: MotherView
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    @ObservedObject var logic: Logic
    @ObservedObject var userConfigureVars: UserConfigureVars
    @ObservedObject var setButtonSelectionVars = SetButtonSelectionVars()
    
    var index = 0
    var type = "core"
    
    /*
     weather or not to show the how to view based on state of button at bottom
     */
    @State var htViewIsHidden = true
    
    var body: some View {
        let currentExercise = logic.returnCorrectExerciseArray(currentType: type)[index]
        
        // number of exercises set by user
        let currentTypeUserConfigVar = LogicUtilites.returnCorrectExerciseInt(currentType: type, userConfigureVars: userConfigureVars)
        
        VStack {
            // displays sets/reps or timer
            CountingView(currentExercise: currentExercise, setButtonSelectionVars: setButtonSelectionVars, timeRemaining: currentExercise.amount)
            
            Spacer()
            
            HStack {
                NavigationLink(
                    destination: HowToView(logic: logic, currentExerciseVars: currentExerciseVars),
                    label: {
                        HStack {
                            Image(systemName: "graduationcap.fill")
                            Text("Directions")
                        }.foregroundColor(.black)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.accentColor)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5))
                    })
                
                Spacer()
                
                if index < currentTypeUserConfigVar - 1 { // next button
                    NavigationLink(
                        destination: DetailView(motherView: motherView, currentExerciseVars: currentExerciseVars, logic: logic, userConfigureVars: userConfigureVars, index: index + 1, type: type),
                        label: {
                            HStack {
                                Text("Next")
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                                    .background(Circle().foregroundColor(.accentColor).frame(width: 40, height: 40))
                            }.padding(20)
                        })
                }
                
            }.padding()
            
        }.background(Color.gray.edgesIgnoringSafeArea(.all)
                        .opacity(0.1))
        .navigationTitle(Text(currentExercise.name))
    }
}



