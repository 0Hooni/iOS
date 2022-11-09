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
    @IBOutlet weak var timer: UILabel!
    var bgm = AVAudioPlayer()
    
    @IBOutlet weak var character: UIImageView!
    @IBOutlet weak var jumpButton: UIButton!
    
    
    // MARK: Function
    @IBAction func tapJumpButton(_ sender: UIButton) {
        print("DEBUG: Press Jump Button")
    }
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: View Did Load")
        // AVAudio Setting
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
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            print("DEBUG: Print READY")
            self.timer.text = "Ready"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("DEBUG: Print GET")
            self.timer.text = "Get"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("DEBUG: Print START")
            self.timer.text = "Start"
        }
        
        // MARK: Game Main Thread
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            print("DEBUG: GAME START")
            print("DEBUG: Music Start")
            self.bgm.play()
            print("DEBUG: Timer start")
            // MARK: Timer thread
            for i in (0...10).reversed() {
                DispatchQueue.main.async {
                    self.timer.text = String(i)
                    print("DEBUG: Tick Tok \(i)")
                }
                sleep(1)
            }
            print("DEBUG: Timer end")
            print("DEBUG: GAME END")
        }
        
    }
    
    // MARK: @objc
}

