//
//  ContentView.swift
//  Workout
//
//  Created by Ally Rilling on 7/21/20.
//

import SwiftUI

// launch screen of app
struct MainView: View {
    @ObservedObject var globalVars: GlobalVars
    
    @State var currentType: String = "Core"
    @State var isActive: Bool = false
    
    /*
     for segmented control labels
     */
    var types = ["Core", "Upper Body", "Lower Body", "Hips"]
    
    var body: some View {
        VStack {
            MainViewTopBar(globalVars: globalVars)
            
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
                ForEach(0 ..< Int(LogicUtilites.returnCorrectExerciseString(currentType: currentType, globalVars: globalVars))!, id:\.self) { index in // this is one cell
                    VStack {
                        Button(action: {
                            globalVars.type = currentType
                            globalVars.index = index
                            isActive.toggle()
                        }, label: {
                            HStack {
                                Text(LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].name) // exercise name in cell
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                if (LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].isTimeBased) { // time based
                                    Text("\(LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].amount) sec")
                                } else { // reps based
                                    Text("\(LogicUtilites.returnCorrectExerciseArray(currentType: currentType, globalVars: globalVars)[index].amount) reps")
                                }
                            }.foregroundColor(.black)
                        }).sheet(isPresented: $isActive) {
                            DetailView(globalVars: globalVars, rootIsActive: $isActive)
                        }
                        
                        if (index < Int(LogicUtilites.returnCorrectExerciseString(currentType: currentType, globalVars: globalVars))! - 1) {
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
