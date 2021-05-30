//
//  ChooseExerciseView.swift
//  Workout
//
//  Created by Ally Rilling on 5/23/21.
//

import SwiftUI

struct OrgExerciseView: View {
    @ObservedObject var globalVars: GlobalVars
    
    var currentType: String
    @State var isActive: Bool = false
    @State var showEditSheet = false
    
    @State private var sortStyle: Int = 0
    @State private var sortOrder: Int = 0
    
    @State var editMode: Bool = false
    
    init(globalVars: GlobalVars, currentType: String) {
        self.globalVars = globalVars
        self.currentType = currentType
        UITableView.appearance().backgroundColor = UIColor(globalVars.secondaryColor)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(currentType)")
                    .font(.system(size: globalVars.bigTitleTS))
                    .padding()
                Spacer()
            }
            
            List {
                ForEach(0 ..< Int(exactly: LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars).count)!, id:\.self) { index in // this is one cell
                    Button(action: {
                        showEditSheet.toggle()
                    }, label: {
                        HStack {
                            Text(LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].name) // exercise name in cell
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(globalVars.accentColor)
                            Spacer()
                            if (LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].isTimeBased) { // time based
                                Text("\(LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].amount) sec")
                            } else { // reps based
                                Text("\(LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].amount) reps")
                            }
                        }
                    }).sheet(isPresented: $showEditSheet) {
                        EditExerciseView(globalVars: globalVars, currentType: currentType, ex: LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index])
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
                    AddExerciseView(globalVars: globalVars, currentType: currentType)
                }
            }.font(.system(size: globalVars.titleTS))
            .padding()
            
        }.accentColor(globalVars.accentColor)
    }

    func removeRows(at offsets: IndexSet) {
        if(currentType == "Core") {
            globalVars.core.remove(atOffsets: offsets)
        } else if (currentType == "Hips") {
            globalVars.hips.remove(atOffsets: offsets)
        } else if (currentType == "Upper Body") {
            globalVars.upperBody.remove(atOffsets: offsets)
        } else if (currentType == "Lower Body") {
            globalVars.lowerBody.remove(atOffsets: offsets)
        }
    }
    

}
