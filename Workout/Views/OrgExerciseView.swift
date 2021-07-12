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
    
    @State var showAddNewExercise: Bool = false
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
                ForEach(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type), id: \.self) { index in  // this is one cell
                    Button(action: {
                        showEditSheet = true
                    }, label: {
                        HStack {
                            Text(index.name) // exercise name in cell
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(globalVars.mainColor)
                            Spacer()
                            if (index.isTimeBased) { // time based
                                Text("\(index.amount) sec")
                            } else { // reps based
                                Text("\(index.amount) reps")
                            }
                        }
                    }).sheet(isPresented: $showEditSheet) {
                        EditExerciseView(globalVars: globalVars, ex: index, type: type)
                    }
                }.onDelete(perform: removeRows)
            }.listStyle(InsetGroupedListStyle())
            .environment(\.editMode, .constant(self.editMode ? EditMode.active : EditMode.inactive))
            
            HStack {
                Button(action: { // edit button
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
                    showAddNewExercise = true
                }, label: {
                    Image(systemName: "plus")
                }).sheet(isPresented: $showAddNewExercise) {
                    AddExerciseView(globalVars: globalVars, type: type)
                }
            }.font(.system(size: globalVars.titleTS))
            .padding()
            
        }.accentColor(globalVars.mainColor)
    }

    func removeRows(at offsets: IndexSet) {
        if(type == "Core") {
            
            if (globalVars.groups[0].perWorkout == globalVars.groups[0].members.count) {
                // have to do this too until get rid of the 4 array construct and move to all group objects
                globalVars.amtExCore = "\(Int(globalVars.amtExCore)! - 1)"
                globalVars.defaults.set(globalVars.amtExCore, forKey: DefaultsKeys.amtExCore.rawValue)
                
                globalVars.groups[0].perWorkout = globalVars.groups[0].perWorkout - 1
            }
            
            for e in globalVars.groups[0].members {
                if e.name == globalVars.core[offsets.first!].name {
                    globalVars.groups[0].members.remove(at: offsets.first!)
                    break
                }
            }
            
            globalVars.core.remove(atOffsets: offsets)
            
        } else if (type == "Upper Body") {
            
            if (globalVars.groups[1].perWorkout == globalVars.groups[1].members.count) {
                print("first")
                // have to do this too until get rid of the 4 array construct and move to all group objects
                globalVars.amtExUpperBody = "\(Int(globalVars.amtExUpperBody)! - 1)"
                globalVars.defaults.set(globalVars.amtExUpperBody, forKey: DefaultsKeys.amtExUpperBody.rawValue)
                
                globalVars.groups[1].perWorkout = globalVars.groups[1].perWorkout - 1
            } else if (globalVars.groups[1].perWorkout > globalVars.groups[1].members.count) {
                print("second")
                // have to do this too until get rid of the 4 array construct and move to all group objects
                globalVars.amtExUpperBody = "\(globalVars.groups[1].members.count)"
                globalVars.defaults.set(globalVars.groups[1].members.count, forKey: DefaultsKeys.amtExUpperBody.rawValue)
                
                globalVars.groups[1].perWorkout = globalVars.groups[1].members.count
            }
            
            for e in globalVars.groups[1].members {
                if e.name == globalVars.upperBody[offsets.first!].name {
                    globalVars.groups[1].members.remove(at: offsets.first!)
                    break
                }
            }
            
            globalVars.upperBody.remove(atOffsets: offsets)
            print("perworkout: \(globalVars.groups[1].perWorkout) | members.count \(globalVars.groups[1].members.count)")

            
        } else if (type == "Lower Body") {
            
            if (globalVars.groups[2].perWorkout == globalVars.groups[2].members.count) {
                // have to do this too until get rid of the 4 array construct and move to all group objects
                globalVars.amtExLowerBody = "\(Int(globalVars.amtExLowerBody)! - 1)"
                globalVars.defaults.set(globalVars.amtExLowerBody, forKey: DefaultsKeys.amtExLowerBody.rawValue)
                
                globalVars.groups[2].perWorkout = globalVars.groups[2].perWorkout - 1
            }
            
            for e in globalVars.groups[2].members {
                if e.name == globalVars.lowerBody[offsets.first!].name {
                    globalVars.groups[2].members.remove(at: offsets.first!)
                    break
                }
            }
            
            globalVars.lowerBody.remove(atOffsets: offsets)
            
        } else if (type == "Hips") {
            
            if (globalVars.groups[3].perWorkout == globalVars.groups[3].members.count) {
                // have to do this too until get rid of the 4 array construct and move to all group objects
                globalVars.amtExHips = "\(Int(globalVars.amtExHips)! - 1)"
                globalVars.defaults.set(globalVars.amtExHips, forKey: DefaultsKeys.amtExHips.rawValue)
                
                globalVars.groups[3].perWorkout = globalVars.groups[3].perWorkout - 1
            }
            
            for e in globalVars.groups[3].members {
                if e.name == globalVars.hips[offsets.first!].name {
                    globalVars.groups[3].members.remove(at: offsets.first!)
                    break
                }
            }
            
            globalVars.hips.remove(atOffsets: offsets)
            
        }
        
        globalVars.encodeGroups(groups: globalVars.groups)
        
    }
    

}

/*
 List {
     ForEach(0 ..< Int(exactly: LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type).count)!, id:\.self) { index in // this is one cell
         Button(action: {
             showEditSheet = true
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
             // this works
             // this doesnt use the index var
//                        Text("index \(index)")
//                        Text("\(globalVars.lowerBody[0].name)")
//                        Text("LU \((LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type).count))")
//                        ForEach (0 ..< LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type).count) { i in
//                            Text("\(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[i].name)")
//                        }
             
             // this does not
             Text("\(globalVars.lowerBody[index].name)")
//                        Text("LU \((LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[index]).name)")
             
//                        EditExerciseView(globalVars: globalVars, ex: LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: type)[index], type: type)
         }
     }.onDelete(perform: removeRows)
 }.listStyle(InsetGroupedListStyle())
 .environment(\.editMode, .constant(self.editMode ? EditMode.active : EditMode.inactive))
 */
