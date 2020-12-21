//
//  HowToLogic.swift
//  Workout
//
//  Created by Ally Rilling on 8/2/20.
//

import Foundation
import AVKit
import SwiftUI

////TODO: - I THINK THIS CLASS IS IRRELEVANT AND CAN BE DELETED
//class HowToLogic {
//    
//    init() {
//        playVideo()
//    }
//    
//    func playVideo() {
//        guard let path = Bundle.main.path(forResource: "rain", ofType: "mp4") else {
//            print("fail")
//            return
//        }
//        let videoURL = NSURL(fileURLWithPath: path)
//        
//        let player = AVPlayer(url: videoURL as URL)
//        let vc = AVPlayerViewController()
//        vc.player = player
//
//        vc.player?.play()
//    }
//    
//    func playVideo2() {
//        guard let path = Bundle.main.path(forResource: "rain", ofType: "mp4") else {
//            print("fail")
//            return
//        }
//        print(path)
//        print()
//        
//        print("ONE")
//        let videoURL = NSURL(fileURLWithPath: path)
//        
//        // Create an AVPlayer, passing it the local video url path
//        print()
//        print("TWO")
//        let player = AVPlayer(url: videoURL as URL)
//        
//        print()
//        print("THREE")
//        let controller = AVPlayerViewController()
//        
//        print()
//        print("FOUR")
//        controller.player = player
//    }
//    
//}
//
////struct Player: UIViewControllerRepresentable {
////
////    func makeUIViewController(context: Context) -> some UIViewController {
////        let controller = AVPlayerViewController()
////        let url = Bundle.main.path(forResource: "rain", ofType: "mp4")
////        let player = AVPlayer(url: URL(string: url!)!)
////        controller.player = player
////        return controller
////    }
////
////    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
////        //
////    }
////
////}
