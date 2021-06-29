//
//  CustomTextFieldView.swift
//  Workout
//
//  Created by Ally Rilling on 8/17/20.
//

import SwiftUI

struct CustomTextFieldView: View {
    @ObservedObject var globalVars: GlobalVars
    
    @State var varToUpdate: String = "" // the var tied to what is typed int he text field
    @State private var isPressed: Bool = false
    
    var type: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("\(type)")
                    .font(.system(size: globalVars.bigTitleTS))
                Text("Edit the amount of exercises to be shown in each \(type.lowercased()) workout.")
                    .font(.system(size: globalVars.bodyTS))
            }.padding()
            
            HStack {
                TextField(LogicUtilites.returnCorrectExerciseString(globalVars: globalVars, currentType: type), text: $varToUpdate)
                    .foregroundColor(globalVars.mainColor.opacity(0.3))
                    .padding(.leading)
                    .keyboardType(.numberPad)
                    .font(.system(size: globalVars.titleTS))
                    .background(ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(globalVars.mainColor, lineWidth: 2)
                    })
                    .frame(width: 130)
                
                Spacer()
                
                Button(action: { // change button
                    self.isPressed.toggle()
                    if varToUpdate != "" && LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type).count >= Int(varToUpdate)! && Int(varToUpdate)! > 0 { // makes sure legal input
                        LogicUtilites.updateUserConfigureVars(globalVars: globalVars, varToUpdate: varToUpdate, type: type)
                    }
                    updateNumberOfEx(exType: type, valToSet: varToUpdate) // calls function to update userdefaults
                    varToUpdate = ""
                    self.endEditing(force: true) // to dismiss keyboard
                }, label: {
                    Text("Change")
                        .foregroundColor(globalVars.mainColor)
                        .font(.system(size: globalVars.titleTS))
                })
                
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.subColor))
            .padding()
            
            Spacer()
        }.accentColor(globalVars.mainColor)
    }

    // updates the user defaults for the amount of the exercise
    func updateNumberOfEx(exType: String, valToSet: String) {
        var amtEx = ""
        if (exType == "Core") {
            amtEx = "amtExCore"
        } else if (exType == "Upper Body") {
            amtEx = "amtExUpperBody"
        } else if (exType == "Lower Body") {
            amtEx = "amtExLowerBody"
        } else if (exType == "Hips") {
            amtEx = "amtExHips"
        }
        globalVars.defaults.set(valToSet, forKey: amtEx)
    }
    
}


