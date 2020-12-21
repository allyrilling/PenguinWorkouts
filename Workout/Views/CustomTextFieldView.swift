//
//  CustomTextFieldView.swift
//  Workout
//
//  Created by Ally Rilling on 8/17/20.
//

import SwiftUI

struct CustomTextFieldView: View {
    /*
     the exercise type to be passed into the tf to display
     */
    var exerciseType: String
    /*
     the var tied to what is typed int he text field
     */
    @State var varToUpdate: String = ""
    /*
     the instance of the data to be passed between configure and content views containing the data about number of exercies per type enereted by user, observed object beccause it changes the the text below each text feild
     */
    @ObservedObject var userConfigureVars: UserConfigureVars
    @State var motherView: MotherView
    
    var body: some View {
        VStack {
            HStack {
                /*
                 text field
                 */
                let textField = TextField(exerciseType, text: $varToUpdate)
                    .padding(.horizontal)
                    .font(.largeTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                textField
                
                /*
                 button to change
                 */
                ButtonWithText(sfSymbolName: "arrow.clockwise", buttonLabel: "Change", circleIsFirst: true)
                    .padding(.trailing)
                    .onTapGesture {
                        /*
                         to make sure that the user cannot pass back an empty string "" and cause an error
                         */
                        if varToUpdate != "" && motherView.logic.returnCorrectExerciseArray(currentType: exerciseType).count >= Int(varToUpdate)! && Int(varToUpdate)! > 0 {
                            LogicUtilites.updateUserConfigureVars(exerciseType: exerciseType, userConfigureVars: userConfigureVars, varToUpdate: varToUpdate)
                        }
                        varToUpdate = ""
                        
                        /*
                         to dismiss the keyboard on change button press
                         */
                        self.endEditing(force: true)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
            }
            
            /*
             the label under each text field w number of exercies
             "showing 12 of 19 exercises"
             */
            HStack {
                HStack {
                    Text("Showing")
                        .padding(.leading)
                    Text("\(LogicUtilites.returnCorrectExerciseString(currentType: exerciseType, userConfigureVars: userConfigureVars))")
                            .fontWeight(.bold)
                    Text("of \(motherView.logic.returnCorrectExerciseArray(currentType: exerciseType).count) exercises")
                }
                Spacer()
            }
            
        }
    }
}
