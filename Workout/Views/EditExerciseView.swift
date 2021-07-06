//
//  EditExerciseView.swift
//  Workout
//
//  Created by Ally Rilling on 5/27/21.
//

import SwiftUI

struct EditExerciseView: View {
    @ObservedObject var globalVars: GlobalVars
    
    @State var isActive: Bool = false
    var ex: Exercise
    
    @State var name = ""
    @State var isTimeBased = 0
    @State var amount = ""
    @State var startingPosition = ""
    @State var description = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) { // all should be textbox inputs that fill out the Exercise.swift form
                Text("Edit Exercise")
                    .font(.system(size: globalVars.bigTitleTS))
                    .padding(.vertical)
                Text("Edit an existing exercise. Save when done.")
                    .font(.system(size: globalVars.bodyTS))
                    .padding(.bottom)
                
                VStack {
                    TextField("\(ex.name)", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Picker(selection: $isTimeBased, label: Text("Is the exercise time or reps based?")) {
                            Text("Time based").tag(0)
                            Text("Reps based").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField(ex.isTimeBased ? "\(ex.amount) seconds" : "\(ex.amount) reps", text: $amount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextEditor(text: $startingPosition)
                        .frame(height: 60)
                        .cornerRadius(5)
                    TextEditor(text: $description)
                        .frame(height: 200)
                        .cornerRadius(5)
                }.padding()
                .onAppear {
                    name = ex.name
                    isTimeBased = (ex.isTimeBased ? 0 : 1)
                    amount = String(ex.amount)
                    startingPosition = ex.startingPosition
                    description = ex.description
                }
                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(globalVars.subColor))
                
                Button(action: {
                    LogicUtilites.findExercise(globalVars: globalVars, ex: ex, name: name, amount: Int(amount) ?? 0, isTimeBased: isTimeBased == 0, startingPosition: startingPosition, description: description)
                    globalVars.groups = [Group(members: globalVars.core, perWorkout: globalVars.core.count), Group(members: globalVars.upperBody, perWorkout: globalVars.upperBody.count), Group(members: globalVars.lowerBody, perWorkout: globalVars.lowerBody.count), Group(members: globalVars.hips, perWorkout: globalVars.hips.count)]
                    globalVars.encodeGroups(groups: globalVars.groups)
                }, label: {
                    HStack {
                        Spacer()
                        Text("Save Exercise")
                            .font(.system(size: globalVars.titleTS))
                        Spacer()
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(globalVars.subColor))
                })
                
            }
        }.padding()
        .accentColor(globalVars.mainColor)
        
    }
}
