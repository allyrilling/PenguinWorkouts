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
    
    /*
     weather or not to show the how to view based on state of button at bottom
     */
    @State var htViewIsHidden = true
    
    var body: some View {
        let currentExerciseType = currentExerciseVars.currentExerciseType
        let currentExerciseIndex = currentExerciseVars.currentExerciseIndex
        let currentExercise = logic.returnCorrectExerciseArray(currentType: currentExerciseType)[index]
        
        /*
         the number of exercises based on the current exercise type chosen
         reflects changes to number of exercises by user
         */
        let currentTypeUserConfigVar = LogicUtilites.returnCorrectExerciseInt(currentType: currentExerciseType, userConfigureVars: userConfigureVars)
        
        /*
         the view that shows time or sets and reps
         */
        let countingView = CountingView(currentExercise: currentExercise, setButtonSelectionVars: setButtonSelectionVars, timeRemaining: currentExercise.amount)
        
        /*
         uses the current exercise type and index to create the detailed view for the selected exercise
         */
        VStack {
            HStack { // detail view top bar
                Button(action: { // back to main menu button
                    motherView.viewState = ViewKeys.mainViewState.rawValue
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .background(Circle().foregroundColor(.accentColor).frame(width: 40, height: 40))
                        Text("Menu")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }.padding(20)
                }
                
                Spacer()
                
                /*
                 shows next exercise button until have reached last next exercise and then it hides it
                 */
                if currentExerciseIndex < currentTypeUserConfigVar - 1 {
                    Button(action: {
                        /*
                         increments index
                         does hacky thing to refresh the detail view state based on the even or odd index of the exercise
                         */
                        currentExerciseVars.currentExerciseIndex = currentExerciseVars.currentExerciseIndex + 1
                        if currentExerciseVars.currentExerciseIndex % 2 == 0 {
                            motherView.viewState = ViewKeys.detailViewState.rawValue
                        } else {
                            motherView.viewState = ViewKeys.detailViewState2.rawValue
                        }
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }) {
                        HStack {
                            Text("Next")
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .background(Circle().foregroundColor(.accentColor).frame(width: 40, height: 40))
                        }.padding(20)
                    }
                }
            }
            
            NavigationLink(
                destination: HowToView(logic: logic, currentExerciseVars: currentExerciseVars),
                label: {
                    Text(currentExercise.name)
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(.black)
                        .padding()
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(10)
                }).navigationTitle(Text(currentExercise.name))
            
            countingView // displays sets/reps or timer
            
            Spacer()
        }.background(Color.gray.edgesIgnoringSafeArea(.all)
                        .opacity(0.1))
    }
}



