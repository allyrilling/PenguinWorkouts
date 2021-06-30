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
    
    @State var showColorThemesView = false
    
    var tileCR: CGFloat = 20
    
    var body: some View {

        ScrollView {
            HStack { // settings text
                Text("Settings")
                    .font(.system(size: globalVars.bigTitleTS, weight: .bold))
                    .padding(.top, 30)
                    .padding(.leading, 20)
                Spacer()
            }
            
            VStack(alignment: .leading) { // color scheme
                HStack {
                    Text("Color Scheme")
                        .font(.system(size: globalVars.titleTS, weight: .semibold))
                    Spacer()
                }
                Text("Current theme is...")
                    .font(.system(size: globalVars.bodyTS))
                HStack {
                    Text("Summer Splash")
                        .font(.system(size: globalVars.midTS, weight: .bold))
                        .padding()
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 20)
                            .foregroundColor(globalVars.mainColor)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 20)
                            .foregroundColor(globalVars.subColor)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 20)
                            .foregroundColor(globalVars.accentColor)
                    }.padding()
                    .background(ZStack {
                        RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .foregroundColor(.black)
                    })
                    .padding(.bottom)
                }
                
                Button(action: {
                    showColorThemesView = true
                }, label: {
                    HStack {
                        Spacer()
                        Text("All color themes")
                        Image(systemName: "chevron.right")
                        Spacer()
                    }.padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                    )
                }).sheet(isPresented: $showColorThemesView) {
                    ColorThemePickerView(globalVars: globalVars)
                }
                
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.subColor))
            .padding()
            
            VStack(alignment: .leading) { // core
                Text("Core")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                Text("Tap a tile to edit the amount.")
                    .font(.system(size: globalVars.bodyTS))
                HStack {
                    Button(action: {
                        numCoreEditable = true
                    }, label: {
                        VStack {
                            Text("\(LogicUtilites.returnCorrectExerciseString(globalVars: globalVars, currentType: "Core"))")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Exercises")
                                .font(.system(size: globalVars.bodyTS))
                            Text("per workout")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $numCoreEditable) {
                        CustomTextFieldView(globalVars: globalVars, type: "Core")
                    }
                    Spacer()
                    Button(action: {
                        showCoreOrg = true
                    }, label: {
                        VStack {
                            Text("\(globalVars.core.count)")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Total")
                                .font(.system(size: globalVars.bodyTS))
                            Text("exercises")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $showCoreOrg) {
                        OrgExerciseView(globalVars: globalVars, type: "Core")
                    }
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.subColor))
            .padding()
            
            VStack(alignment: .leading) { // ub
                Text("Upper Body")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                Text("Tap a tile to edit the amount.")
                    .font(.system(size: globalVars.bodyTS))
                HStack {
                    Button(action: {
                        numUBEditable = true
                    }, label: {
                        VStack {
                            Text("\(LogicUtilites.returnCorrectExerciseString(globalVars: globalVars, currentType: "Upper Body"))")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Exercises")
                                .font(.system(size: globalVars.bodyTS))
                            Text("per workout")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $numUBEditable) {
                        CustomTextFieldView(globalVars: globalVars, type: "Upper Body")
                    }
                    Spacer()
                    Button(action: {
                        showUBOrg = true
                    }, label: {
                        VStack {
                            Text("\(globalVars.upperBody.count)")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Total")
                                .font(.system(size: globalVars.bodyTS))
                            Text("exercises")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $showUBOrg) {
                        OrgExerciseView(globalVars: globalVars, type: "Upper Body")
                    }
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.subColor))
            .padding()
            
            VStack(alignment: .leading) { // lower body
                Text("Lower Body")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                Text("Tap a tile to edit the amount.")
                    .font(.system(size: globalVars.bodyTS))
                HStack {
                    Button(action: {
                        numLBEditable = true
                    }, label: {
                        VStack {
                            Text("\(LogicUtilites.returnCorrectExerciseString(globalVars: globalVars, currentType: "Lower Body"))")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Exercises")
                                .font(.system(size: globalVars.bodyTS))
                            Text("per workout")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $numLBEditable) {
                        CustomTextFieldView(globalVars: globalVars, type: "Lower Body")
                    }
                    Spacer()
                    Button(action: {
                        showLBOrg = true
                    }, label: {
                        VStack {
                            Text("\(globalVars.lowerBody.count)")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Total")
                                .font(.system(size: globalVars.bodyTS))
                            Text("exercises")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $showLBOrg) {
                        OrgExerciseView(globalVars: globalVars, type: "Lower Body")
                    }
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.subColor))
            .padding()
            
            VStack(alignment: .leading) { // hips
                Text("Hips")
                    .font(.system(size: globalVars.titleTS, weight: .semibold))
                Text("Tap a tile to edit the amount.")
                    .font(.system(size: globalVars.bodyTS))
                HStack {
                    Button(action: {
                        numHipsEditable = true
                    }, label: {
                        VStack {
                            Text("\(LogicUtilites.returnCorrectExerciseString(globalVars: globalVars, currentType: "Hips"))")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Exercises")
                                .font(.system(size: globalVars.bodyTS))
                            Text("per workout")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $numHipsEditable) {
                        CustomTextFieldView(globalVars: globalVars, type: "Hips")
                    }
                    Spacer()
                    Button(action: {
                        showHipsOrg = true
                    }, label: {
                        VStack {
                            Text("\(globalVars.hips.count)")
                                .font(.system(size: globalVars.bigTitleTS))
                            Text("Total")
                                .font(.system(size: globalVars.bodyTS))
                            Text("exercises")
                                .font(.system(size: globalVars.bodyTS))
                        }.padding()
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: tileCR)
                                        .foregroundColor(.white))
                    }).sheet(isPresented: $showHipsOrg) {
                        OrgExerciseView(globalVars: globalVars, type: "Hips")
                    }
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(globalVars.subColor))
            .padding()
            
            Spacer()
        }.accentColor(globalVars.mainColor)
    }
}

extension View { // allows keyboard to be dismissed when change button is pressed
    func endEditing(force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}

