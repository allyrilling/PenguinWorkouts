//
//  ConfigureView.swift
//  Workout
//
//  Created by Ally Rilling on 7/23/20.
//

import SwiftUI

struct ConfigureView: View {
    @ObservedObject var globalVars: GlobalVars
    @Binding var configureIsActive: Bool // determines weather the user dismisses the screen
    @State var isActive: Bool = false
    @State var numCoreEditable = false
    @State var showCoreOrg = false
    @State var numUBEditable = false
    @State var showUBOrg = false
    @State var numLBEditable = false
    @State var showLBOrg = false
    @State var numHipsEditable = false
    @State var showHipsOrg = false
    
    var body: some View {

        ScrollView {
            HStack { // settings text
                Text("Settings")
                    .font(.system(size: globalVars.bigTitleTS, weight: .bold))
                    .padding(.top, 30)
                    .padding(.leading, 20)
                Spacer()
            }
            
            VStack(alignment: .leading) { // accent color
                HStack {
                    Text("Accent Color")
                        .font(.system(size: globalVars.titleTS, weight: .semibold))
                    Spacer()
                }
                Text("Choose your accent color!")
                    .font(.system(size: globalVars.bodyTS))
                HStack {
                    AccentColorButton(globalVars: globalVars, color: .red)
                    AccentColorButton(globalVars: globalVars, color: .orange)
                    AccentColorButton(globalVars: globalVars, color: .yellow)
                    AccentColorButton(globalVars: globalVars, color: .green)
                    AccentColorButton(globalVars: globalVars, color: .blue)
                    AccentColorButton(globalVars: globalVars, color: .purple)
                    AccentColorButton(globalVars: globalVars, color: .black)
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.secondaryColor))
            .padding()
            
            VStack(alignment: .leading) { // Secondary color
                HStack {
                    Text("Secondary Color")
                        .font(.system(size: globalVars.titleTS, weight: .semibold))
                    Spacer()
                }
                Text("Pick a secondary color...")
                    .font(.system(size: globalVars.bodyTS))
                HStack {
                    SecondaryColorButton(globalVars: globalVars, color: .red)
                    SecondaryColorButton(globalVars: globalVars, color: .orange)
                    SecondaryColorButton(globalVars: globalVars, color: .yellow)
                    SecondaryColorButton(globalVars: globalVars, color: .green)
                    SecondaryColorButton(globalVars: globalVars, color: .blue)
                    SecondaryColorButton(globalVars: globalVars, color: .purple)
                    SecondaryColorButton(globalVars: globalVars, color: .gray)
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.secondaryColor))
            .padding()
            
            VStack(alignment: .leading) { // core
                Text("Core")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                HStack {
                    Text("Exercises per workout: \(LogicUtilites.returnCorrectExerciseString(currentType: "Core", globalVars: globalVars))")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { numCoreEditable = true }, label: { Text("Change")  })
                        .sheet(isPresented: $numCoreEditable) {
                            CustomTextFieldView(globalVars: globalVars, stringType: "Core")
                        }
                }
                HStack {
                    Text("Total exercises: \(globalVars.core.count)")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { showCoreOrg = true }) { Text("Manage") }
                        .sheet(isPresented: $showCoreOrg) {
                            OrgExerciseView(globalVars: globalVars, currentType: "Core")
                        }
                }
                    
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.secondaryColor))
            .padding()
            
            VStack(alignment: .leading) { // ub
                Text("Upper Body")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                HStack {
                    Text("Exercises per workout: \(LogicUtilites.returnCorrectExerciseString(currentType: "Upper Body", globalVars: globalVars))")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { numUBEditable = true }, label: { Text("Change")  })
                        .sheet(isPresented: $numUBEditable) {
                            CustomTextFieldView(globalVars: globalVars, stringType: "Upper Body")
                        }
                }
                HStack {
                    Text("Total exercises: \(globalVars.upperBody.count)")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { showUBOrg = true }) { Text("Manage") }
                        .sheet(isPresented: $showUBOrg) {
                            OrgExerciseView(globalVars: globalVars, currentType: "Upper Body")
                        }
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.secondaryColor))
            .padding()
            
            VStack(alignment: .leading) { // Lower Body
                Text("Lower Body")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                HStack {
                    Text("Exercises per workout: \(LogicUtilites.returnCorrectExerciseString(currentType: "Lower Body", globalVars: globalVars))")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { numLBEditable = true }, label: { Text("Change")  })
                        .sheet(isPresented: $numLBEditable) {
                            CustomTextFieldView(globalVars: globalVars, stringType: "Lower Body")
                        }
                }
                HStack {
                    Text("Total exercises: \(globalVars.lowerBody.count)")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { showLBOrg = true }) { Text("Manage") }
                        .sheet(isPresented: $showLBOrg) {
                            OrgExerciseView(globalVars: globalVars, currentType: "Lower Body")
                        }
                }
                    
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.secondaryColor))
            .padding()
            
            VStack(alignment: .leading) { // Hips
                Text("Hips")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                HStack {
                    Text("Exercises per workout: \(LogicUtilites.returnCorrectExerciseString(currentType: "Hips", globalVars: globalVars))")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { numHipsEditable = true }, label: { Text("Change")  })
                        .sheet(isPresented: $numHipsEditable) {
                            CustomTextFieldView(globalVars: globalVars, stringType: "Hips")
                        }
                }
                HStack {
                    Text("Total exercises: \(globalVars.hips.count)")
                        .font(.system(size: globalVars.bodyTS))
                    Spacer()
                    Button(action: { showHipsOrg = true }) { Text("Manage") }
                        .sheet(isPresented: $showHipsOrg) {
                            OrgExerciseView(globalVars: globalVars, currentType: "Hips")
                        }
                }
                    
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.secondaryColor))
            .padding()
            
            Spacer()
        }.accentColor(globalVars.accentColor)
    }
}

extension View { // allows keyboard to be dismissed when change button is pressed
    func endEditing(force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}

/*
 struct ConfigureView: View {
    @ObservedObject var globalVars: GlobalVars
    @Binding var configureIsActive: Bool // determines weather the user dismisses the screen
    
    var body: some View {
        
        // text fields
        let ubTFHS = CustomTextFieldView(globalVars: globalVars, stringType: "Upper Body")
        let lbTFHS = CustomTextFieldView(globalVars: globalVars, stringType: "Lower Body")
        let coreTFHS = CustomTextFieldView(globalVars: globalVars, stringType: "Core")
        let hipsTFHS = CustomTextFieldView(globalVars: globalVars, stringType: "Hips")
        
        ScrollView { // call each declaration of the text field
            HStack {
                Text("Configure")
                    .padding()
                    .font(.system(size: 40, weight: .semibold))
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BackgroundColor"))
                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    .padding()
                
                Spacer()
            }
            
            coreTFHS
            ubTFHS
            lbTFHS
            hipsTFHS
            
            HStack {
                Button(action: {
                    globalVars.amtExUpperBody = String(globalVars.upperBody.count)
                    globalVars.amtExLowerBody = String(globalVars.lowerBody.count)
                    globalVars.amtExCore = String(globalVars.core.count)
                    globalVars.amtExHips = String(globalVars.hips.count)
                }, label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("All Exercises")
                    }.foregroundColor(.accentColor)
                    .padding()
                }).buttonStyle(NeuButtonStyle(isRoundRect: true))
                
                Spacer()
                
                Button(action: {
                    configureIsActive.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.foregroundColor(.accentColor)
                    .padding()
                }).buttonStyle(NeuButtonStyle(isRoundRect: true))
            }.padding()
            
        }.padding()
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    }
}



*/
