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
    
    /*
     weather or not to show the how to view based on state of button at bottom
     */
    @State var htViewIsHidden = true
    
    var body: some View {
        let currentExerciseType = currentExerciseVars.currentExerciseType
        let currentExerciseIndex = currentExerciseVars.currentExerciseIndex
        let currentExercise = logic.returnCorrectExerciseArray(currentType: currentExerciseType)[currentExerciseIndex]
        
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
            /*
             detail view top button bar
             */
            HStack(alignment: .top) {
                Button(action: { // back to main menu button
                    motherView.viewState = ViewKeys.mainViewState.rawValue
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                }) {
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.accentColor)
                                .frame(width: 40, height: 40)
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }
                        Text("Menu")
                            .foregroundColor(.black)
                    }
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
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.accentColor)
                                    .frame(width: 40, height: 40)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }.padding()
            
            NavigationLink(
                destination: HowToView(logic: logic, currentExerciseVars: currentExerciseVars),
                label: {
                    Text(currentExercise.name)
                        .font(.system(size: 45, weight: .bold))
                        .padding()
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(10)
                }).navigationTitle(Text("Back"))
            
//            Text(currentExercise.name) // exercise name
//                .font(.system(size: 45, weight: .bold))
//                .padding()
//                .multilineTextAlignment(.center)
//                .fixedSize(horizontal: false, vertical: true)
//                .lineLimit(10)
            
            countingView // displays sets/reps or timer
            
            Spacer()
            
//            /*
//             based on state of ht var hides or shows description of exercise
//             */
//            if !htViewIsHidden {
//                HowToView(logic: logic,
//                          currentExerciseVars: currentExerciseVars)
//                    .padding(.horizontal)
//            }
//
//            /*
//             hide show button
//             */
//            HideShowHowToButton(detailView: self)
        }.background(Color.gray.edgesIgnoringSafeArea(.all)
                        .opacity(0.1))
    }
}



