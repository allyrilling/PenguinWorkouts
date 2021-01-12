//
//  DetailView.swift
//  Workout
//
//  Created by Ally Rilling on 7/31/20.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var globalVars: GlobalVars
    @Binding var rootIsActive: Bool
    
    @State var howToIsActive = false
    
    var body: some View {
        let currentExercise = LogicUtilites.returnCorrectExerciseArray(currentType: globalVars.type, globalVars: globalVars)[globalVars.index]
        
        // number of exercises set by user
        let currentTypeUserConfigVar: Int = Int(LogicUtilites.returnCorrectExerciseInt(currentType: globalVars.type, globalVars: globalVars))
        
        ScrollView {
            VStack {
                Text(currentExercise.name) // exercise name
                    .padding()
                    .font(.system(size: 40, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BackgroundColor"))
                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    .padding()
                
                let countingView = CountingView(globalVars: globalVars)
                countingView // displays sets/reps or timer
                
                Spacer()
                
                HStack {
                    VStack {
                        Button(action: { // directions button
                            howToIsActive.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "graduationcap.fill")
                                Text("Directions")
                            }.foregroundColor(.accentColor)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                        }).padding(.bottom)
                        .sheet(isPresented: $howToIsActive) {
                            HowToView(globalVars: globalVars, howToIsActive: $howToIsActive)
                        }
                        
                        Button(action: { // home button
                            countingView.countingLogic.resetTimer(countingView: countingView, globalVars: globalVars)
                            globalVars.setsSliderValue = 0
                            self.rootIsActive = false
                        }, label: {
                            HStack {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }.foregroundColor(.accentColor)
                            .padding()
                            .frame(width: 145)
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                        })
                        
                    }
                    
                    Spacer()
                    
                    if (globalVars.index < currentTypeUserConfigVar - 1) { // next button
                        Button(action: {
                            globalVars.index = globalVars.index + 1
                            let nextExercise = LogicUtilites.returnCorrectExerciseArray(currentType: globalVars.type, globalVars: globalVars)[globalVars.index]
                            if(nextExercise.isTimeBased) {
                                countingView.countingLogic.resetTimer(countingView: countingView, globalVars: globalVars)
                            } else { // here
                                globalVars.reps = nextExercise.amount
                                globalVars.setsSliderValue = 0
                            }
                        }, label: {
                            HStack {
                                Text("Next")
                                Image(systemName: "arrow.right")
                            }.foregroundColor(.accentColor)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("BackgroundColor"))
                                            .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                            })
                        }
                }.padding()
            }.padding(.vertical)
        }.background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    }
}
