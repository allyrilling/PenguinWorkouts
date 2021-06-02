//
//  HowToView.swift
//  Workout
//
//  Created by Ally Rilling on 8/2/20.
//

import SwiftUI

struct HowToView: View {
    @ObservedObject var globalVars: GlobalVars
    @Binding var howToIsActive: Bool
    
    var body: some View {
        let currentExerciseIndex = globalVars.index
        let currentExercise = LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[currentExerciseIndex]
        let descriptionArray = currentExercise.description.split(separator: "\n")
        
        ScrollView {
            VStack {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 100))
                    .foregroundColor(globalVars.accentColor)
                
                VStack { // starting position
                    Text("Starting Position")
                        .font(.system(size: 38, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(currentExercise.startingPosition)
                        .font(.system(size: 20))
                        .padding([.horizontal, .bottom])
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.vertical)
                
                VStack { // directions
                    ForEach(descriptionArray, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                    }.padding([.bottom, .horizontal])
                }.padding(.vertical)
                   
                Button(action: { // back button
                    howToIsActive.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Back")
                    }.foregroundColor(globalVars.mainColor)
                    .padding()
                    .frame(width: 145)
                }).buttonStyle(SnazzyBS(globalVars: globalVars))
                .padding()
                
            }.padding()
        }
    }
}
