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
                        /*
                         to make sure that the user cannot pass back an empty string "" and cause an error
                         */
                        if varToUpdate != "" && LogicUtilites.returnCorrectExerciseArray(currentType: stringType, globalVars: globalVars).count >= Int(varToUpdate)! && Int(varToUpdate)! > 0 {
                            LogicUtilites.updateUserConfigureVars(exerciseType: stringType, globalVars: globalVars, varToUpdate: varToUpdate)
                            print("Chan")
                        }
                        varToUpdate = ""
                        
                        /*
                         to dismiss the keyboard on change button press
                         */
                        self.endEditing(force: true)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }, label: {
                        ZStack {
                            if(isPressed) {
                                ZStack {
                                    Capsule()
                                        .stroke(Color.gray, lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 2, y: 2)
                                        .mask(Capsule().fill(LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                                    Capsule()
                                        .stroke(Color.white, lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: -2, y: -2)
                                        .mask(Capsule().fill(LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .bottomTrailing, endPoint: .topLeading)))
                                }
                            } else {
                                Capsule()
                                    .foregroundColor(.white)
                                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                            }
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                Text("Change")
                            }
                        }.frame(width: 120)
                    }).animation(.interpolatingSpring(stiffness: 100, damping: 100))
                }
            }.padding()
            
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
