//
//  ChooseExerciseView.swift
//  Workout
//
//  Created by Ally Rilling on 5/23/21.
//

import SwiftUI

struct OrgExerciseView: View {
    @ObservedObject var globalVars: GlobalVars
    var type: String
    
    @State var isActive: Bool = false
    @State var showEditSheet = false
    
    @State private var sortStyle: Int = 0
    @State private var sortOrder: Int = 0
    
    @State var editMode: Bool = false
    
    init(globalVars: GlobalVars, type: String) {
        self.globalVars = globalVars
        self.type = type
        UITableView.appearance().backgroundColor = UIColor(globalVars.accentColor)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(type)")
                    .font(.system(size: globalVars.bigTitleTS, weight: .bold))
                    .padding()
                Spacer()
            }
            
            List {
                ForEach(0 ..< Int(exactly: LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type).count)!, id:\.self) { index in // this is one cell
                    Button(action: {
                        showEditSheet.toggle()
                    }, label: {
                        HStack {
                            Text(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[index].name) // exercise name in cell
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(globalVars.mainColor)
                            Spacer()
                            if (LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[index].isTimeBased) { // time based
                                Text("\(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[index].amount) sec")
                            } else { // reps based
                                Text("\(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[index].amount) reps")
                            }
                        }
                    }).sheet(isPresented: $showEditSheet) {
                        EditExerciseView(globalVars: globalVars, ex: LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[index])
                    }
                }.onDelete(perform: removeRows)
            }.listStyle(InsetGroupedListStyle())
            .environment(\.editMode, .constant(self.editMode ? EditMode.active : EditMode.inactive))
            
            HStack {
                Button(action: {
                    self.editMode = !self.editMode
                }, label: {
                    Image(systemName: !self.editMode ? "pencil" : "checkmark" )
                })
                
                Spacer()
                
                Menu(content: { // sort menu
                    Button(action: {
                        LogicUtilites.sortAlphabetically(globalVars: globalVars)
                    }, label: {
                        Text("Alphabetically")
                    })
                    Button(action: {
                        LogicUtilites.sortAmountAsc(globalVars: globalVars)
                    }, label: {
                        Text("Amount Ascending")
                    })
                    Button(action: {
                        LogicUtilites.sortAmountDesc(globalVars: globalVars)
                    }, label: {
                        Text("Amount Descending")
                    })
                }, label: {
                    Image(systemName: "arrow.up.arrow.down")
                })
                
                Spacer()
                
                Button(action: { // add new exercise
                    isActive = true
                }, label: {
                    Image(systemName: "plus")
                }).sheet(isPresented: $isActive) {
                    AddExerciseView(globalVars: globalVars, type: type)
                }
            }.font(.system(size: globalVars.titleTS))
            .padding()
            
        }.accentColor(globalVars.mainColor)
    }

    func removeRows(at offsets: IndexSet) {
        if(type == "Core") {
            globalVars.core.remove(atOffsets: offsets)
        } else if (type == "Hips") {
            globalVars.hips.remove(atOffsets: offsets)
        } else if (type == "Upper Body") {
            globalVars.upperBody.remove(atOffsets: offsets)
        } else if (type == "Lower Body") {
            globalVars.lowerBody.remove(atOffsets: offsets)
        }
    }
    

}
