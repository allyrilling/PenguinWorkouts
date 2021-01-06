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
    @State var isActive: Bool = false
    
    /*
     for segmented control labels
     */
    var types = ["Core", "Upper Body", "Lower Body", "Hips"]
    
    var body: some View {
        VStack {
            MainViewTopBar(logic: logic, motherView: motherView, currentType: currentType)
            
            Picker("Type", selection: $currentType) {
                ForEach(types, id: \.self) { type in
                    Text(type)
                }
            }.onAppear() {
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
                UISegmentedControl.appearance().backgroundColor = UIColor(Color("NeuLight"))
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 5)
            .cornerRadius(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                        .blur(radius: 2)
                        .offset(x: 2, y: 2)
                        .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                        .blur(radius: 2)
                        .offset(x: -2, y: -2)
                        .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .bottomTrailing, endPoint: .topLeading)))
                }.frame(height: 40)
            )
            .padding()
            
            ScrollView {
                ForEach(0 ..< Int(LogicUtilites.returnCorrectExerciseString(currentType: currentType, userConfigureVars: userConfigureVars))!, id:\.self) { index in // this is one cell
                    VStack {
                        NavigationLink(
                            destination: DetailView(motherView: motherView, currentExerciseVars: currentExerciseVars, logic: logic, userConfigureVars: userConfigureVars, rootIsActive: $isActive, index: index, type: currentType),
                            isActive: self.$isActive,
                            label: {
                                // currentExerciseVars.currentExerciseType = currentType -> was doing this in the on tap gesture, not sure if i still need to be doing it
                                HStack {
                                    Text(logic.returnCorrectExerciseArray(currentType: currentType)[index].name) // exercise name in cell
                                        .fontWeight(.semibold)
                                        .font(.system(size: 20))
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    if (logic.returnCorrectExerciseArray(currentType: currentType)[index].isTimeBased) { // time based
                                        Text("\(logic.returnCorrectExerciseArray(currentType: currentType)[index].amount) sec")
                                    } else { // reps based
                                        Text("\(logic.returnCorrectExerciseArray(currentType: currentType)[index].amount) reps")
                                    }
                                    Image(systemName: "chevron.right")
                                }.foregroundColor(.black)
                            }
                        ).isDetailLink(false)
                        if (index < Int(LogicUtilites.returnCorrectExerciseString(currentType: currentType, userConfigureVars: userConfigureVars))! - 1) {
                            RoundedRectangle(cornerRadius: 3, style: .continuous)
                                .frame(height: 2)
                                .foregroundColor((Color("BackgroundColor")))
                        }
                    }
                }
            }.padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("BackgroundColor"))
                    .shadow(color: Color("NeuDark"), radius: 5, x: 5, y: 5)
                    .shadow(color: Color("NeuLight"), radius: 10, x: -5, y: -5)
            ).padding()
            
        }.background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    }
}
