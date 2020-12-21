//
//  SetsRepsView.swift
//  Workout
//
//  Created by Ally Rilling on 8/24/20.
//

import SwiftUI

struct SetsRepsView: View {
    var countingView: CountingView
    /*
     the buttons to keep track of the sets
     */
    @ObservedObject var setButtonSelectionVars: SetButtonSelectionVars
    var countingLogic: CountingLogic
    var currentExercise: Exercise
    @State var currentExerciseAmount: Int
    
    var body: some View {
        
        
        
        ZStack {
            
//            HStack {
//                Spacer()
//                RoundedRectangle(cornerRadius: 2)
//                    .frame(width: 2, height: 100)
//                    .foregroundColor(Color.accentColor)
//                    .opacity(0.5)
//                    .padding(.leading)
//                Spacer()
//            }
            
            HStack {
                
                // Set buttons
                VStack {
                    HStack {
                        SetButton(setNumber: 1, countingView: countingView)
                            .onTapGesture {
                                setButtonSelectionVars.isSelected1 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected1)
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                        Text("Set 1")
                    }
                    HStack {
                        SetButton(setNumber: 2, countingView: countingView)
                            .onTapGesture {
                                setButtonSelectionVars.isSelected2 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected2)
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                        Text("Set 2")
                    }
                    HStack {
                        SetButton(setNumber: 3, countingView: countingView)
                            .onTapGesture {
                                setButtonSelectionVars.isSelected3 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected3)
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                        Text("Set 3")
                    }
                }.padding(.horizontal)
                
                Spacer()
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 2, height: 100)
                    .foregroundColor(Color.accentColor)
                    .opacity(0.5)
                    .padding(1)
                Spacer()
                
                // Reps view
                VStack {
                    HStack {
                        Text(String(currentExerciseAmount))
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                        Text("Reps")
                            .font(.system(size: 25))
                    }.padding(.top)
                    HStack {
                        ButtonWithText(sfSymbolName: "plus", buttonLabel: "", circleIsFirst: true)
                            .onTapGesture {
                                currentExerciseAmount = currentExerciseAmount + 1
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                        ButtonWithText(sfSymbolName: "arrow.counterclockwise", buttonLabel: "", circleIsFirst: true)
                            .onTapGesture {
                                currentExerciseAmount = currentExercise.amount
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                        ButtonWithText(sfSymbolName: "minus", buttonLabel: "", circleIsFirst: true)
                            .onTapGesture {
                                if currentExerciseAmount > 0 {
                                    currentExerciseAmount = currentExerciseAmount - 1
                                }
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                    }
                }.padding([.bottom, .trailing])
            }
            
        }.overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.accentColor, lineWidth: 3)
        ).padding()
        
    }
}

/*
 HStack {
     Spacer()
     
     VStack {
         Text("Sets")
             .font(.system(size: 45))
             .fontWeight(.bold)
         
         /*
          3 horizontal buttons to track sets
          */
         HStack {
             SetButton(setNumber: 1, countingView: countingView)
                 .onTapGesture {
                     setButtonSelectionVars.isSelected1 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected1)
                     UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                 }
             SetButton(setNumber: 2, countingView: countingView)
                 .onTapGesture {
                     setButtonSelectionVars.isSelected2 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected2)
                     UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                 }
             SetButton(setNumber: 3, countingView: countingView)
                 .onTapGesture {
                     setButtonSelectionVars.isSelected3 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected3)
                     UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                 }
         }.padding(.bottom)
         
     }
     
     Spacer()
     
     RoundedRectangle(cornerRadius: 2)
         .frame(width: 2, height: 100)
         .foregroundColor(Color.accentColor)
         .opacity(0.5)
         .padding(.leading)

     Spacer()
     
     VStack {
         Text("Reps")
             .font(.system(size: 45))
             .fontWeight(.bold)
         Text(String(currentExercise.amount))
             .font(.system(size: 40))
     }.padding()
     
     Spacer()
     
 }.overlay(
     RoundedRectangle(cornerRadius: 10)
         .stroke(Color.accentColor, lineWidth: 3)
 ).padding(.horizontal)
 */


/*
 ZStack {
     
     HStack {
         Spacer()
         RoundedRectangle(cornerRadius: 2)
             .frame(width: 2, height: 100)
             .foregroundColor(Color.accentColor)
             .opacity(0.5)
             .padding(.leading)
         Spacer()
     }
     
     HStack {
         // sets
         VStack {
             
             Text("Sets")
                 .font(.system(size: 45))
                 .fontWeight(.bold)
                 .padding(.bottom, 5)
             
             HStack {
                 SetButton(setNumber: 1, countingView: countingView)
                     .onTapGesture {
                         setButtonSelectionVars.isSelected1 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected1)
                         UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                     }
                 SetButton(setNumber: 2, countingView: countingView)
                     .onTapGesture {
                         setButtonSelectionVars.isSelected2 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected2)
                         UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                     }
                 SetButton(setNumber: 3, countingView: countingView)
                     .onTapGesture {
                         setButtonSelectionVars.isSelected3 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected3)
                         UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                     }
             }
             
         }.padding()
         
         Spacer()
         
         // reps
         VStack {
             Text("Reps")
                 .font(.system(size: 45))
                 .fontWeight(.bold)
             Text(String(currentExercise.amount))
                 .font(.system(size: 40))
             HStack {
                 ButtonWithText(sfSymbolName: "plus", buttonLabel: "", circleIsFirst: true)
                 ButtonWithText(sfSymbolName: "minus", buttonLabel: "", circleIsFirst: true)
             }
             
         }.padding()
         
     }
 }.overlay(
     RoundedRectangle(cornerRadius: 10)
         .stroke(Color.accentColor, lineWidth: 3)
 ).padding()
 */


/*
 VStack {
     HStack {
         Text("Sets")
             .font(.system(size: 45))
             .fontWeight(.bold)
             .padding(.horizontal)
         
         SetButton(setNumber: 1, countingView: countingView)
             .onTapGesture {
                 setButtonSelectionVars.isSelected1 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected1)
                 UIImpactFeedbackGenerator(style: .medium).impactOccurred()
             }
         SetButton(setNumber: 2, countingView: countingView)
             .onTapGesture {
                 setButtonSelectionVars.isSelected2 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected2)
                 UIImpactFeedbackGenerator(style: .medium).impactOccurred()
             }
         SetButton(setNumber: 3, countingView: countingView)
             .onTapGesture {
                 setButtonSelectionVars.isSelected3 = countingLogic.toggleSetButtonSelection(isSelected: setButtonSelectionVars.isSelected3)
                 UIImpactFeedbackGenerator(style: .medium).impactOccurred()
             }
         Spacer()
     }
     
     HStack {
         Text("Reps")
             .font(.system(size: 45))
             .fontWeight(.bold)
             .padding(.horizontal)
         Text(String(currentExercise.amount))
             .font(.system(size: 40))
         ButtonWithText(sfSymbolName: "plus", buttonLabel: "", circleIsFirst: true)
         ButtonWithText(sfSymbolName: "minus", buttonLabel: "", circleIsFirst: true)
         Spacer()
     }
     
 }.overlay(
     RoundedRectangle(cornerRadius: 10)
         .stroke(Color.accentColor, lineWidth: 3)
 ).padding()
 */
