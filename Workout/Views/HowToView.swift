//
//  HowToView.swift
//  Workout
//
//  Created by Ally Rilling on 8/2/20.
//

import SwiftUI
import AVKit

/*
 shows the video of each exercise
 */
struct HowToView: View {
    @ObservedObject var logic: Logic
    @ObservedObject var currentExerciseVars: CurrentExerciseVars
    
    var body: some View {
        let currentExerciseType = currentExerciseVars.currentExerciseType
        let currentExerciseIndex = currentExerciseVars.currentExerciseIndex
        let currentExercise = logic.returnCorrectExerciseArray(currentType: currentExerciseType)[currentExerciseIndex]
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.accentColor, lineWidth: 3)
            ScrollView {
                VStack {
                    Text("Starting Position")
                        .multilineTextAlignment(.leading)
                        .lineLimit(10)
                        .font(.system(size: 25))
                    Text(currentExercise.startingPosition)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(10)
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 300, height: 2)
                        .foregroundColor(Color.accentColor)
                        .opacity(0.5)
                    Text(currentExercise.description)
                        .lineLimit(10)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding()
            }.padding(.vertical, 5)
        }
    }
        
        
        
        //FIXME: - text
//        Player(currentExercise: currentExercise)
        
    }
    
    

///*
// the video player
// */
//struct Player: UIViewControllerRepresentable {
//
//    var currentExercise: Exercise
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let controller = AVPlayerViewController()
//        let path = Bundle.main.path(forResource: currentExercise.videoURL, ofType: "mp4")
//        let url = NSURL(fileURLWithPath: path!)
//        let player = AVPlayer(url: url as URL)
//        controller.player = player
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//    }
//    
//}

/*
 struct HowToView: View {
     @ObservedObject var logic: Logic
     @ObservedObject var currentExerciseVars: CurrentExerciseVars
     
     var body: some View {
         let currentExerciseType = currentExerciseVars.currentExerciseType
         let currentExerciseIndex = currentExerciseVars.currentExerciseIndex
         let currentExercise = logic.returnCorrectExerciseArray(currentType: currentExerciseType)[currentExerciseIndex]
         
         Player(currentExercise: currentExercise)
     }
     
     
 }

 /*
  the video player
  */
 struct Player: UIViewControllerRepresentable {
     
     var currentExercise: Exercise
     
     func makeUIViewController(context: Context) -> some UIViewController {
         let controller = AVPlayerViewController()
         let path = Bundle.main.path(forResource: currentExercise.videoURL, ofType: "mp4")
         let url = NSURL(fileURLWithPath: path!)
         let player = AVPlayer(url: url as URL)
         controller.player = player
         return controller
     }
     
     func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
     }
     
 }
 */
