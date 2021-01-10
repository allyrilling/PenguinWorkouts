////
////  CustomBackToMenuButton.swift
////  Workout
////
////  Created by Ally Rilling on 8/2/20.
////
//
//import SwiftUI
//
///*
// back to all exercises view button
// */
//struct CustomBackToMenuButton: View {
//    @State var motherView: MotherView
//    
//    var body: some View {
//        HStack {
//            ButtonWithText(sfSymbolName: "arrow.left", buttonLabel: "Menu", circleIsFirst: true)
//            Spacer()
//        }.onTapGesture {
//            motherView.viewState = ViewKeys.mainViewState.rawValue
//            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
//        }
//    }
//}
