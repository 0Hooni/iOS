//
//  ChatViewController.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/11/03.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let testList = chatList.data
    let cellName = "CustomTableViewCell"
    let cellReuseIdentifier = "chatCell"

    
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Function
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! CustomTableViewCell
        let target = testList[indexPath.row]
        
        let img = UIImage(named: "\(target.userName)_profile")
        cell.profileImage.image = img
        // 프로필 이미지 원형으로 바꾸기
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
        cell.profileImage.layer.borderWidth = 1
        cell.profileImage.layer.borderColor = UIColor.clear.cgColor
        cell.profileImage.clipsToBounds = true

        
        cell.userName.text = target.userName
        cell.town_timeGo.text = "\(target.userTown) • \(target.lastChatTimeGo)달 전"
        cell.lastChat.text = target.lastChat
        
        
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        
        return cell
    }
}
