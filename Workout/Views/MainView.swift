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
    //FIXME: - hips
//    var types = ["Upper Body", "Lower Body", "Core"]
    var types = ["Upper Body", "Lower Body", "Core", "Hips"]
    
    var body: some View {
        /*
         the configure view to be navigated to when the user hits the configure button
         */
        VStack {
            /*
             the navigation bar that hosues the Randomize and configure buttons
             */
            MainViewTopBar(logic: logic, motherView: motherView, currentType: currentType)
                .padding(.vertical)

            /*
             creates the segmented picker control w the specified array of exercise types
             */
            Picker("Type", selection: $currentType) {
                ForEach(types, id: \.self) { type in
                    Text(type)
                }
            }.onAppear() {
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            /*
             populates the list with the exercies from each section depending on which section of the picker is selected
             */
            List {
                Section {
                    /*
                     this is one cell
                     */
                    ForEach(0 ..< Int(LogicUtilites.returnCorrectExerciseString(currentType: currentType, userConfigureVars: userConfigureVars))!, id:\.self) { index in
                        HStack {
                            /*
                             displays exercise name in cell
                             */
                            Text(logic.returnCorrectExerciseArray(currentType: currentType)[index].name)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.leading)
                            Spacer()
                            /*
                             sets or reps based on specific exercise
                             */
                            if logic.returnCorrectExerciseArray(currentType: currentType)[index].isTimeBased {
                                Text("\(logic.returnCorrectExerciseArray(currentType: currentType)[index].amount) sec")
                            } else {
                                Text("\(logic.returnCorrectExerciseArray(currentType: currentType)[index].amount) reps")
                            }
                            /*
                             the arrow in the cell
                             */
                            Image(systemName: "chevron.right")
                                .padding(.leading)
                        }.onTapGesture {
                            /*
                             makes the current index selected the global index var and moves to detail view of the selected cell
                             */
                            currentExerciseVars.currentExerciseIndex = index
                            currentExerciseVars.currentExerciseType = currentType
                            motherView.viewState = ViewKeys.detailViewState.rawValue
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                    }
                }
            }.listStyle(InsetGroupedListStyle())
        }
    }
}

