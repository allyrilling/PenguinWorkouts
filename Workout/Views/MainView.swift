//
//  ContentView.swift
//  Workout
//
//  Created by Ally Rilling on 7/21/20.
//

import SwiftUI

/*
 the view of the app that contains the menubar, timer, and exercies
 */
struct MainView: View {
    /*
     see mother view for def of these vars
     */
    @State var motherView: MotherView
    @State var currentType: String
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    @ObservedObject var userConfigureVars: UserConfigureVars
    @ObservedObject var logic: Logic
    var logicUtilites: LogicUtilites
    
    /*
     for segmented control labels
     */
    var types = ["Core", "Upper Body", "Lower Body", "Hips"]
    
    var body: some View {
        NavigationView {
            VStack {
                MainViewTopBar(logic: logic, motherView: motherView, currentType: currentType)
                
                Picker("Type", selection: $currentType) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }.onAppear() {
                    UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                List { // populates the list with the exercies from each section depending on which section of the picker is selected
                    Section {
                        ForEach(0 ..< Int(LogicUtilites.returnCorrectExerciseString(currentType: currentType, userConfigureVars: userConfigureVars))!, id:\.self) { index in // this is one cell
                            VStack {
                                NavigationLink(
                                    destination: DetailView(motherView: motherView, currentExerciseVars: currentExerciseVars, logic: logic, userConfigureVars: userConfigureVars, index: index, type: currentType),
                                    label: {
                                        // currentExerciseVars.currentExerciseType = currentType -> was doing this in the on tap gesture, not sure if i still need to be doing it
                                        HStack {
                                            Text(logic.returnCorrectExerciseArray(currentType: currentType)[index].name) // exercise name in cell
                                                .fontWeight(.semibold)
                                                .font(.system(size: 20))
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            if logic.returnCorrectExerciseArray(currentType: currentType)[index].isTimeBased { // time based
                                                Text("\(logic.returnCorrectExerciseArray(currentType: currentType)[index].amount) sec")
                                            } else { // reps based
                                                Text("\(logic.returnCorrectExerciseArray(currentType: currentType)[index].amount) reps")
                                            }
                                        }
                                    })
                            }
                        }
                    }
                }.listStyle(InsetGroupedListStyle())
            }.navigationBarHidden(true)
        }
    }
}

