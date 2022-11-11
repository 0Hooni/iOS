//  ViewController.swift
//  Cat Adventure
//  Created by 송영훈 on 2022/11/08.

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    // MARK: Object & Var
    @IBOutlet weak var timer: UILabel!
    var bgm = AVAudioPlayer()
    var slimeImageView = UIImageView(image: UIImage(named: "slime"))    // 스폰할 이미지 설정
    var characterYPosition = 0.0    // 고양이의 위치
    lazy var totalWidth: CGFloat = {    // 화면 밖으로 좌표 설정
        return self.view.frame.width + 2*slimeImageView.frame.width
    }()
    
    @IBOutlet weak var character: UIImageView!
    @IBOutlet weak var jumpButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    // MARK: Function
    @IBAction func tapJumpButton(_ sender: UIButton) {
        print("DEBUG: Press Jump Button")
        UIView.animate(withDuration: 0.4) {
            self.character.transform = CGAffineTransform(translationX: 0, y:-124)
        } completion: { finished in
            UIView.animate(withDuration: 0.4) {
                self.character.transform = .identity
            }
        }
    }
    @IBAction func tapPauseButton(_ sender: UIButton) {
        print("DEBUG: Press Pause Button")
    }
    func GameReadyBeforeStart() {
        DispatchQueue.main.async {
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
    }
    func MusicStart() {
        print("DEBUG: Music Start")
        self.bgm.play()
    }
    func TimerStart() {
        print("DEBUG: Timer start")
        for i in (0...60).reversed() {
            DispatchQueue.main.async {
                self.timer.text = String(i)
                print("DEBUG: Now Time is \(i) Second")
                if i%5 == 0 {
                    self.spawnMonster()
                }
            }
            sleep(1)
        }
        print("DEBUG: Timer end")
    }
    func GameStart() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            print("DEBUG: GAME START")
            self.MusicStart()
            self.TimerStart()
            print("DEBUG: GAME END")
        }
    }
    func spawnMonster() {
        slimeImageView.frame = CGRect(origin: CGPoint(x: totalWidth, y: CGFloat(characterYPosition)), size: slimeImageView.frame.size)
        self.view.addSubview(slimeImageView)
        print("DEBUG: Slime Spawn")
        UIView.animate(withDuration: 3.4) {
            self.slimeImageView.frame.origin = CGPoint(x: -(self.slimeImageView.frame.width + 100), y: CGFloat(self.characterYPosition))
        }
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
    override func viewWillAppear(_ animated: Bool) {
        characterYPosition = character.frame.origin.y + character.frame.height
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("DEBUG: View will appear")
        GameReadyBeforeStart()
        GameStart()
    }
}

