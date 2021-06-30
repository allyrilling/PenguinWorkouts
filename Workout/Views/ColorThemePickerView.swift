//
//  ColorThemePickerView.swift
//  Workout
//
//  Created by Ally Rilling on 6/30/21.
//

import SwiftUI

struct ColorThemePickerView: View {
    var globalVars: GlobalVars
    
    var columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            HStack { // color themes text
                Text("Themes")
                    .font(.system(size: globalVars.bigTitleTS, weight: .bold))
                    .padding(.top, 30)
                    .padding(.leading, 20)
                Spacer()
            }
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 16,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                Section() {
                    ColorThemeButton(globalVars: globalVars, theme: ColorThemes.summerSplash)
                    ColorThemeButton(globalVars: globalVars, theme: ColorThemes.pastelDreams)
                    ColorThemeButton(globalVars: globalVars, theme: ColorThemes.lusciousLemonade)
                }
                
                Section() {
                    ColorThemeButton(globalVars: globalVars, theme: ColorThemes.fernBank)
                }
            }
        }
    }
}
