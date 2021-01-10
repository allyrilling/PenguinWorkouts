////
////  SetButton.swift
////  Workout
////
////  Created by Ally Rilling on 8/2/20.
////
//
//import SwiftUI
//
///*
// the button that denotes weather a set has been completed or not
// */
//struct SetButton: View {
//    var setNumber: Int
//    var countingView: CountingView
//
//    var body: some View {
//        let isSelected = countingView.countingLogic.returnCorrectIsSelectedVar(setButtonSelectionVars: countingView.setButtonSelectionVars, setNumber: setNumber)
//        /*
//         changes state based on if the set is completed by user
//         */
//        if isSelected {
//            Image(systemName: "largecircle.fill.circle")
//                .font(.system(size: 30))
//        } else {
//            Image(systemName: "circle")
//                .font(.system(size: 30))
//        }
//    }
//}
