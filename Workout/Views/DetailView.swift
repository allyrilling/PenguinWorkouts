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
        
        /*
         uses the current exercise type and index to create the detailed view for the selected exercise
         */
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
        
        
        VStack {
            /*
             detail view ttop button bar
             */
            HStack {
                CustomBackToMenuButton(motherView: motherView)
                
                Spacer()
                
                /*
                 shows next exercise button until have reached last next exercise and then it hides it
                 */
                if currentExerciseIndex < currentTypeUserConfigVar - 1 {
                    CustomNextExerciseButton(motherView: motherView, currentExerciseVars: currentExerciseVars)
                }
                
            }.padding()
            
            /*
             displayes sets and reps or timer
             */
            countingView
            
            /*
             name of exercise
             */
            Text(currentExercise.name)
                .font(.system(size: 45))
                .padding()
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(10)
            
            Spacer()
            
            /*
             based on state of ht var hides or shows description of exercise
             */
            if !htViewIsHidden {
                HowToView(logic: logic,
                          currentExerciseVars: currentExerciseVars)
                    .padding(.horizontal)
            }
            
            /*
             hide show button
             */
            HideShowHowToButton(detailView: self)
        }
        
    }
}



