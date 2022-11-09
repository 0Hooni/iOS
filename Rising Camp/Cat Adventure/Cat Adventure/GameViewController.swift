//
//  ViewController.swift
//  Cat Adventure
//
//  Created by 송영훈 on 2022/11/08.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    // MARK: Object & Var
    @IBOutlet weak var Timer: UILabel!
    var bgm = AVAudioPlayer()
    
    @IBOutlet weak var character: UIImageView!
    @IBOutlet weak var attackButton: UIImageView!
    @IBOutlet weak var jumpButton: UIImageView!
    
    
    // MARK: Function
    @IBAction func tapJumpButton(_ sender: Any?) {
        print("DEBUG: Press Jump Button")
    }
    @IBAction func tapAttackButton(_ sender: Any?) {
        print("DEBUG: Press Attack Button")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: View Did Load")
        
        // MARK: AVAudio Setting
        guard let fileName = Bundle.main.url(forResource: "BGM", withExtension: "mp3")
        else { return }
        do {
            bgm = try AVAudioPlayer(contentsOf: fileName, fileTypeHint: AVFileType.mp3.rawValue)
        } catch { print("DEBUG: error") }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("DEBUG: View will appear")
        
        // MARK: READY PART
        print("DEBUG: Print READY")
        self.Timer.text = "Ready"
        sleep(1)
        print("DEBUG: Print GET")
        self.Timer.text = "Get"
        sleep(1)
        print("DEBUG: Print START")
        self.Timer.text = "Start"
        sleep(1)
        
        // MARK: Game Main Thread
        DispatchQueue.global().async {
            print("DEBUG: GAME START")
            print("DEBUG: Music Start")
            self.bgm.play()
            print("DEBUG: Timer start")
            // MARK: Timer thread
            for i in (0...60).reversed() {
                DispatchQueue.main.async {
                    self.Timer.text = String(i)
                    print("DEBUG: Tick Tok \(i)")
                }
                sleep(1)
            }
            print("DEBUG: Timer end")
            print("DEBUG: GAME END")
        }
        
    }
    
}

