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
        let currentExercise = LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[globalVars.index]
        
        // number of exercises set by user
        let currentTypeUserConfigVar: Int = Int(LogicUtilites.returnCorrectExerciseInt( globalVars: globalVars))
        
        ScrollView {
            VStack {
                Text(currentExercise.name) // exercise name
                    .padding()
                    .font(.system(size: 40, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.white))
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
                        }).buttonStyle(SnazzyBS(globalVars: globalVars))
                        .padding(.bottom)
                        .sheet(isPresented: $howToIsActive) {
                            HowToView(globalVars: globalVars, howToIsActive: $howToIsActive)
                        }
                        
                        Button(action: { // home button
                            CountingLogic.resetTimer(globalVars: globalVars)
                            globalVars.setsSliderValue = 0
                            self.rootIsActive = false
                        }, label: {
                            HStack {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }.foregroundColor(.accentColor)
                            .padding()
                            .frame(width: 145)
                        }).buttonStyle(SnazzyBS(globalVars: globalVars))
                        
                    }
                    
                    Spacer()
                    
                    if (globalVars.index < currentTypeUserConfigVar - 1) { // next button
                        Button(action: {
                            globalVars.index = globalVars.index + 1
                            let nextExercise = LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[globalVars.index]
                            if(nextExercise.isTimeBased) {
                                CountingLogic.resetTimer(globalVars: globalVars)
                            } else {
                                globalVars.reps = nextExercise.amount
                                globalVars.setsSliderValue = 0
                            }
                        }, label: {
                            HStack {
                                Text("Next")
                                Image(systemName: "arrow.right")
                            }.foregroundColor(.accentColor)
                            .padding()
                            }).buttonStyle(SnazzyBS(globalVars: globalVars))
                        }
                }.padding()
                .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white))
                .padding()
            }.padding(.vertical)
        }.accentColor(globalVars.mainColor)
        .background(globalVars.accentColor.edgesIgnoringSafeArea(.all))
    }
}

struct DetailViewPreview: PreviewProvider {
    @State static var isActive: Bool = false
    
    static var previews: some View {
        DetailView(globalVars: GlobalVars(), rootIsActive: $isActive)
    }
}

