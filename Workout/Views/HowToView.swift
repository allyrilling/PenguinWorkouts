//
//  HowToView.swift
//  Workout
//
//  Created by Ally Rilling on 8/2/20.
//

import SwiftUI

struct HowToView: View {
    @ObservedObject var logic: Logic
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    
    var body: some View {
        let currentExerciseType = currentExerciseVars.currentExerciseType
        let currentExerciseIndex = currentExerciseVars.currentExerciseIndex
        let currentExercise = logic.returnCorrectExerciseArray(currentType: currentExerciseType)[currentExerciseIndex]
        let descriptionArray = currentExercise.description.split(separator: "\n")
        
        ScrollView {
            VStack {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.accentColor)
                VStack {
                    Text("Starting Position")
                        .font(.system(size: 38, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(currentExercise.startingPosition)
                        .font(.system(size: 20))
                        .padding([.horizontal, .bottom])
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                }.background(Color.white
                                .cornerRadius(20)
                                .frame(width: UIScreen.main.bounds.width - 40))
                .padding()
                
                VStack {
                    ForEach(descriptionArray, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            
                    }.padding([.bottom, .horizontal])
                }.padding([.top, .horizontal])
                .background(Color.white
                                .cornerRadius(15)
                                .frame(width: UIScreen.main.bounds.width - 40))
            }
        }.background(Color.gray.edgesIgnoringSafeArea(.all)
                        .opacity(0.1))
    }
}
