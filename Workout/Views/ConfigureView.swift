//
//  ConfigureView.swift
//  Workout
//
//  Created by Ally Rilling on 7/23/20.
//

import SwiftUI

/*
 the view that the user enters the amount of exercises they want for each exercise type
 */
struct ConfigureView: View {
    /*
     the mother view to return to when going back
     */
    @State var motherView: MotherView
    
    /*
     instance of the data amount of exercies per type that the user enters to be passed back to content view
     */
    var userConfigureVars: UserConfigureVars
    
    var body: some View {
        
        // text fields
        let ubTFHS = CustomTextFieldView(exerciseType: "Upper Body", userConfigureVars: userConfigureVars, motherView: motherView)
        let lbTFHS = CustomTextFieldView(exerciseType: "Lower Body", userConfigureVars: userConfigureVars, motherView: motherView)
        let coreTFHS = CustomTextFieldView(exerciseType: "Core", userConfigureVars: userConfigureVars, motherView: motherView)
        let hipsTFHS = CustomTextFieldView(exerciseType: "Hips", userConfigureVars: userConfigureVars, motherView: motherView)
        
        ScrollView { // call each declaration of the text field
            ubTFHS
            lbTFHS
            coreTFHS
            hipsTFHS
            
            /*
             the show all exercises button
             */
            HStack {
                ButtonWithText(sfSymbolName: "plus", buttonLabel: "Show all exercises", circleIsFirst: true)
                    .padding()
                    .onTapGesture {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        userConfigureVars.amtExUpperBody = String(motherView.logic.upperBody.count)
                        userConfigureVars.amtExLowerBody = String(motherView.logic.lowerBody.count)
                        userConfigureVars.amtExCore = String(motherView.logic.core.count)
                        userConfigureVars.amtExHips = String(motherView.logic.hips.count)
                    }
                Spacer()
            }
        }.background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
        .navigationTitle("Configure")
    }
}

extension View { // allows keyboard to be dismissed when change button is pressed
    func endEditing(force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}

