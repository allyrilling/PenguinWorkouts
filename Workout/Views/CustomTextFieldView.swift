//
//  CustomTextFieldView.swift
//  Workout
//
//  Created by Ally Rilling on 8/17/20.
//

import SwiftUI

struct CustomTextFieldView: View {
    @ObservedObject var globalVars: GlobalVars
    var stringType: String
    
    @State var varToUpdate: String = "" // the var tied to what is typed int he text field
    @State private var isPressed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(stringType)")
                .font(.system(size: globalVars.bigTitleTS))
                .padding([.horizontal, .top])
            
            HStack {
                TextField(stringType, text: $varToUpdate)
                    .foregroundColor(globalVars.accentColor.opacity(0.3))
                    .padding(.leading)
                    .keyboardType(.numberPad)
                    .font(.system(size: globalVars.titleTS))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(globalVars.accentColor, lineWidth: 2))
                    .frame(width: 130)
                
                Button(action: { // change button
                    self.isPressed.toggle()
                    if varToUpdate != "" && LogicUtilites.returnCorrectExerciseArray(currentType: stringType, globalVars: globalVars).count >= Int(varToUpdate)! && Int(varToUpdate)! > 0 { // makes sure legal input
                        LogicUtilites.updateUserConfigureVars(exerciseType: stringType, globalVars: globalVars, varToUpdate: varToUpdate)
                    }
                    varToUpdate = ""
                    
                    self.endEditing(force: true) // to dismiss keyboard
                }, label: {
                    Text("Change")
                        .foregroundColor(globalVars.accentColor)
                        .font(.system(size: globalVars.titleTS))
                })
                
                Spacer()
                
            }.padding()
            
            Text("Exercises per workout: \(LogicUtilites.returnCorrectExerciseString(currentType: "Core", globalVars: globalVars))")
                .font(.system(size: globalVars.bodyTS))
                .padding()
           
            Text("Edit the amount of exercises to be shown in each \(stringType.lowercased()) workout.")
                .font(.system(size: globalVars.bodyTS))
                .padding()
            
            Spacer()
        }.background(RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(globalVars.secondaryColor))
    }
    
}


/*
 struct CustomTextFieldView: View {
     @ObservedObject var globalVars: GlobalVars
     var stringType: String
     
     @State var varToUpdate: String = "" // the var tied to what is typed int he text field
     @State private var isPressed: Bool = false
     
     var body: some View {
         VStack {
             HStack {
                 let textField = TextField(stringType, text: $varToUpdate)
                     .padding(.horizontal)
                     .keyboardType(.numberPad)
                     .font(.title)
                     .cornerRadius(20)
                 
                 textField.background(
                     ZStack {
                         RoundedRectangle(cornerRadius: 20)
                             .stroke(Color.gray, lineWidth: 2)
                             .blur(radius: 2)
                             .offset(x: 2, y: 2)
                             .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                         RoundedRectangle(cornerRadius: 20)
                             .stroke(Color.white, lineWidth: 2)
                             .blur(radius: 2)
                             .offset(x: -2, y: -2)
                             .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .bottomTrailing, endPoint: .topLeading)))
                     }.frame(height: 50))
                 
                 VStack { // change button
                     Button(action: {
                         self.isPressed.toggle()
                         if varToUpdate != "" && LogicUtilites.returnCorrectExerciseArray(currentType: stringType, globalVars: globalVars).count >= Int(varToUpdate)! && Int(varToUpdate)! > 0 { // makes sure legal input
                             LogicUtilites.updateUserConfigureVars(exerciseType: stringType, globalVars: globalVars, varToUpdate: varToUpdate)
                         }
                         varToUpdate = ""
                         
 //                        self.endEditing(force: true) // to dismiss keyboard
                     }, label: {
                         HStack {
                             Image(systemName: "arrow.clockwise")
                             Text("Change")
                         }.padding()
                     }).buttonStyle(NeuButtonStyle(isRoundRect: false))
                 }
             }
             
             HStack { // "showing 12 of 19 exercises"
                 HStack {
                     Text("Showing")
                         .padding(.leading)
                     Text("\(LogicUtilites.returnCorrectExerciseString(currentType: stringType, globalVars: globalVars))")
                         .fontWeight(.bold)
                     Text("of \(LogicUtilites.returnCorrectExerciseArray(currentType: stringType, globalVars: globalVars).count) exercises")
                 }
                 Spacer()
             }.padding(.bottom)
             
         }
     }
     
 }

 */
