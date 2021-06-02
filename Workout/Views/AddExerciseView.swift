//
//  AddExerciseView.swift
//  Workout
//
//  Created by Ally Rilling on 5/25/21.
//

import SwiftUI

struct AddExerciseView: View {
    @ObservedObject var globalVars: GlobalVars
    var type: String
    
    @State var isActive: Bool = false
    
    @State var name = ""
    @State var isTimeBased = 0
    @State var amount = ""
    @State var startingPosition = ""
    @State var description = ""
    
    var body: some View {
        VStack(alignment: .leading) { // all should be textbox inputs that fill out the Exercise.swift form
            Text("New Exercise")
                .font(.system(size: globalVars.bigTitleTS))
                .padding(.top)
            Text("Add a new exercise. If no seconds / reps are provided, zero will be used. Starting position and description are optional.")
                .font(.system(size: globalVars.bodyTS))
                .padding(.bottom)
            
            VStack(alignment: .leading) {
                TextField("Exercise name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Picker(selection: $isTimeBased, label: Text("Is the exercise time or reps based?")) {
                        Text("Time based").tag(0)
                        Text("Reps based").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                TextField(isTimeBased == 0 ? "How many seconds per exercise?" : "How many reps per exercise?", text: $amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Exercise starting position", text: $startingPosition)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Exercise description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(globalVars.subColor))
            
            Button(action: {
                let newEx = Exercise(name: name == "" ? "New Exercise" : name, amount: Int(amount) ?? 0, isTimeBased: (isTimeBased == 0), description: description, startingPosition: startingPosition)
                LogicUtilites.appendNewExercise(globalVars: globalVars, ex: newEx, type: type)
            }, label: {
                HStack {
                    Spacer()
                    Text("Add New Exercise")
                        .font(.system(size: globalVars.titleTS))
                    Spacer()
                }.padding()
                .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(globalVars.subColor))
            })
            
        }.padding()
        .accentColor(globalVars.mainColor)
        
        Spacer()
    }
    
}

