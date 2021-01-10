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
        let currentExerciseType = globalVars.type
        let currentExerciseIndex = globalVars.index
        let currentExercise = LogicUtilites.returnCorrectExerciseArray(currentType: globalVars.type, globalVars: globalVars)[currentExerciseIndex]
        let descriptionArray = currentExercise.description.split(separator: "\n")
        
        ScrollView {
            VStack {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.accentColor)
                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5)
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
                }.background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("BackgroundColor"))
                                .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5)
                                .frame(width: UIScreen.main.bounds.width - 40))
                .padding(.vertical)
                
                VStack {
                    ForEach(descriptionArray, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                    }.padding([.bottom, .horizontal])
                }.padding(.vertical)
                .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("BackgroundColor"))
                                .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5)
                                .frame(width: UIScreen.main.bounds.width - 40))
                   
                Button(action: {
                    howToIsActive.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Back")
                    }.foregroundColor(.accentColor)
                    .padding()
                    .frame(width: 145)
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BackgroundColor"))
                                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5))
                    .padding()
                })
                
            }.padding()
        }.background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    }
}
