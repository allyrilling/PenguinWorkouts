////
////  HideShowHowToButton.swift
////  Workout
////
////  Created by Ally Rilling on 8/2/20.
////
//
//import SwiftUI
//
///*
// button in detail view that hides and shows the how to view
// */
//struct HideShowHowToButton: View {
//    var detailView: DetailView
//
//    var body: some View {
//        ZStack {
//            /*
//             detail view not showing
//             */
//            if detailView.htViewIsHidden {
//                HStack {
//                    ButtonWithText(sfSymbolName: "eye", buttonLabel: "Show How To", circleIsFirst: true)
//                        .padding()
//                    Spacer()
//                }
//            }
//            /*
//             detail view showing
//             */
//            else {
//                HStack {
//                    ButtonWithText(sfSymbolName: "eye.slash", buttonLabel: "Hide How To", circleIsFirst: true)
//                        .padding()
//                    Spacer()
//                }
//            }
//        }.onTapGesture {
//            /*
//             reverse the state of the button
//             */
//            if detailView.htViewIsHidden {
//                detailView.htViewIsHidden = false
//            } else {
//                detailView.htViewIsHidden = true
//            }
//            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//        }
//    }
//}
//
