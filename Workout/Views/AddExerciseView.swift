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
    
    @Binding var isActive: Bool
    
    @State var name = ""
    @State var isTimeBased = 0
    @State var amount = ""
    @State var startingPosition = "Starting Position"
    @State var description = "Description"
    
    var body: some View {
        VStack(alignment: .leading) { // all should be textbox inputs that fill out the Exercise.swift form
            Text("New Exercise")
                .font(.system(size: globalVars.bigTitleTS))
                .padding(.top)
            Text("Add a new exercise. If no seconds / reps are provided, zero will be used. Starting position and description are optional.")
                .font(.system(size: globalVars.bodyTS))
                .padding(.bottom)
            
            VStack(alignment: .leading) {
                TextField("Exercise Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Picker(selection: $isTimeBased, label: Text("Is the exercise time or reps based?")) {
                        Text("Time Based").tag(0)
                        Text("Reps Based").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                TextField(isTimeBased == 0 ? "How many seconds per exercise?" : "How many reps per exercise?", text: $amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                TextEditor(text: $startingPosition)
                    .onTapGesture {
                        startingPosition = ""
                    }
                    .frame(height: 60)
                    .cornerRadius(5)
                TextEditor(text: $description)
                    .onTapGesture {
                        description = ""
                    }
                    .frame(height: 100)
                    .cornerRadius(5)
            }.padding()
            .font(.system(size: globalVars.bodyTS))
            .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(globalVars.accentColor))
            
            Button(action: {
                let newEx = Exercise(name: name == "" ? "New Exercise \(LogicUtilites.newExerciseNumberIncrement(globalVars: globalVars))" : name, amount: Int(amount) ?? 0, isTimeBased: (isTimeBased == 0), description: description, startingPosition: startingPosition)
                LogicUtilites.appendNewExercise(globalVars: globalVars, ex: newEx, type: type)
                globalVars.groups = [Group(name: "Core", members: globalVars.core, perWorkout: Int(globalVars.amtExCore)!), Group(name: "Upper Body", members: globalVars.upperBody, perWorkout: Int(globalVars.amtExUpperBody)!), Group(name: "Lower Body", members: globalVars.lowerBody, perWorkout: Int(globalVars.amtExLowerBody)!), Group(name: "Hips", members: globalVars.hips, perWorkout: Int(globalVars.amtExHips)!)]
                globalVars.encodeGroups(groups: globalVars.groups)
                self.isActive = false
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

