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
                    }.font(.system(size: globalVars.midTS, weight: .bold))
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
                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .padding()
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(globalVars.accentColor)))
                .padding()
                
                Spacer()
                    .frame(height: 50)
                
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 16,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    Section() {
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.summerSplash, themeName: ColorThemeNames.summerSplash.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.pastelDreams, themeName: ColorThemeNames.pastelDreams.rawValue)
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.lusciousLemonade, themeName: ColorThemeNames.lusciousLemonade.rawValue)
                    }

                    Section() {
                        ColorThemeButton(globalVars: globalVars, theme: ColorThemes.fernBank, themeName: ColorThemeNames.fernBank.rawValue)
                    }
                }
            }
        }
    }
}
