//
//  ViewController.swift
//  MyFriends
//
//  Created by 송영훈 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        if cell == nil || cell.detailTextLabel == nil {
                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                }

        let friend: Friend = self.friends[indexPath.row]
        cell.textLabel?.text = friend.name + "(\(friend.age))"
        cell.detailTextLabel?.text = friend.address_info.city + ", " + friend.address_info.country
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription )
        }
        
        self.tableView.reloadData()
    }


}

