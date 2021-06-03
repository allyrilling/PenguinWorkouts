//
//  ContentView.swift
//  Workout
//
//  Created by Ally Rilling on 7/21/20.
//

import SwiftUI
import CoreData

// launch screen of app
struct MainView: View {
    @ObservedObject var globalVars: GlobalVars
    
    @Environment(\.managedObjectContext) var context
    
    @State var isActive: Bool = false
    
    init(globalVars: GlobalVars) {
        self.globalVars = globalVars
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            MainViewTopBar(globalVars: globalVars)
            
            List {
                ForEach(0 ..< Int(LogicUtilites.returnCorrectExerciseString(globalVars: globalVars, currentType: globalVars.type))!, id:\.self) { index in // this is one cell
                    VStack {
                        Button(action: {
                            globalVars.index = index
                            isActive.toggle()
                            
                            CountingLogic.resetTimer(globalVars: globalVars) // so that timer does not keep running in the background
                            
                            let currentExercise = LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[globalVars.index]
                            if(currentExercise.isTimeBased) {
                                globalVars.timeRemaining = currentExercise.amount
                            } else {
                                globalVars.reps = currentExercise.amount
                            }
                            
                        }, label: {
                            HStack {
                                Text(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[index].name) // exercise name in cell
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                if (LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[index].isTimeBased) { // time based
                                    Text("\(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[index].amount) sec")
                                } else { // reps based
                                    Text("\(LogicUtilites.returnCorrectExerciseArray(globalVars: globalVars, type: globalVars.type)[index].amount) reps")
                                }
                            }.foregroundColor(globalVars.mainColor)
                        }).sheet(isPresented: $isActive) {
                            DetailView(globalVars: globalVars, rootIsActive: $isActive)
                        }
                        
                    }
                }
            }.listStyle(InsetGroupedListStyle())
            .background(globalVars.accentColor.edgesIgnoringSafeArea(.bottom))
        }.accentColor(globalVars.mainColor)
    }
}
