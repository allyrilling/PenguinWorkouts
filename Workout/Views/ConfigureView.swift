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
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BackgroundColor"))
                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    .padding()
                })
                
                Spacer()
                
                Button(action: {
                    configureIsActive.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.foregroundColor(.accentColor)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BackgroundColor"))
                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    .padding()
                })
            }
            
        }.padding()
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    }
}

extension View { // allows keyboard to be dismissed when change button is pressed
    func endEditing(force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}

