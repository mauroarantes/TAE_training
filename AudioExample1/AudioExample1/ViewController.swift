//
//  ViewController.swift
//  AudioExample1
//
//  Created by Mauro Arantes on 14/12/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let player = player, player.isPlaying {
            player.stop()
            button.setTitle("PLAY", for: .normal)
        } else {
            button.setTitle("STOP", for: .normal)
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                let urlString = Bundle.main.path(forResource: "file_example", ofType: "mp3")
                
                guard let urlString = urlString else {return}
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {return}
                
                player.play()
            } catch {
                print("error")
            }
        }
    }


}

