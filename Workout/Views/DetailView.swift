//
//  DetailView.swift
//  Workout
//
//  Created by Ally Rilling on 7/31/20.
//

import SwiftUI

/*
 the view that has the specific exercise and its sets and reps where applicable
 */
struct DetailView: View {
    /*
     see mother view for var descriptions
     */
    @State var motherView: MotherView
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    @ObservedObject var logic: Logic
    @ObservedObject var userConfigureVars: UserConfigureVars
    @ObservedObject var setButtonSelectionVars = SetButtonSelectionVars()
    @Binding var rootIsActive: Bool
    
    var index: Int
    var type: String
    
    /*
     weather or not to show the how to view based on state of button at bottom
     */
    @State var htViewIsHidden = true
    
    @State var howToIsActive = false
    
    var body: some View {
        let currentExercise = logic.returnCorrectExerciseArray(currentType: currentExerciseVars.currentExerciseType)[currentExerciseVars.currentExerciseIndex]
        
        // number of exercises set by user
        let currentTypeUserConfigVar = LogicUtilites.returnCorrectExerciseInt(currentType: type, userConfigureVars: userConfigureVars)
        
        ScrollView {
            VStack {
                Text(currentExercise.name)
                    .padding()
                    .font(.system(size: 40, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BackgroundColor"))
                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    .padding()
                
                // displays sets/reps or timer
                CountingView(currentExercise: currentExercise, currentExerciseVars: currentExerciseVars, logic: logic, setButtonSelectionVars: setButtonSelectionVars, timeRemaining: currentExercise.amount)
                
                Spacer()
                
                HStack {
                    VStack {
                        Button(action: {
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
                            HowToView(logic: logic, currentExerciseVars: currentExerciseVars, howToIsActive: $howToIsActive)
                        }
                        
                        Button(action: {
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
                    
                    if index < currentTypeUserConfigVar - 1 { // next button
                        Button(action: {
                            currentExerciseVars.currentExerciseIndex = currentExerciseVars.currentExerciseIndex + 1
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
