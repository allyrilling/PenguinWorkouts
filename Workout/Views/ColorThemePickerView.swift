//
//  ColorThemePickerView.swift
//  Workout
//
//  Created by Ally Rilling on 6/30/21.
//

import SwiftUI

struct ColorThemePickerView: View {
    @ObservedObject var globalVars: GlobalVars
    
    var columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack { // color themes text
                    Text("Themes")
                        .font(.system(size: globalVars.bigTitleTS, weight: .bold))
                        .padding(.top, 30)
                        .padding(.leading, 20)
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(globalVars.themeName.split(separator: " ")[0])
                        Text(globalVars.themeName.split(separator: " ")[1])
                    }.font(.system(size: globalVars.midTS))
                    .padding()
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(globalVars.mainColor)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(globalVars.subColor))
                            .padding()
                    })
                }.padding()
                .padding()
                .background(HStack {
                    RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .padding()
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 20)
                                                    .foregroundColor(globalVars.accentColor))
                })
                .padding()
                
//                Spacer()
//                    .frame(height: 50)
                
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 16,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    Section() {
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.oceanSplash, themeName: ColorThemeNames.oceanSplash.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.dreamState, themeName: ColorThemeNames.dreamState.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.goldenLemonade, themeName: ColorThemeNames.goldenLemonade.rawValue)
                    }

                    Section() {
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.fernBank, themeName: ColorThemeNames.fernBank.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.roseyCream, themeName: ColorThemeNames.roseyCream.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.mossySlate, themeName: ColorThemeNames.mossySlate.rawValue)
                    }
                    
                    Section() {
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.watermelonSugar, themeName: ColorThemeNames.watermelonSugar.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.sandyBeach, themeName: ColorThemeNames.sandyBeach.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.hazelnutCoffee, themeName: ColorThemeNames.hazelnutCoffee.rawValue)
                    }
                }
            }
        }
    }
}
