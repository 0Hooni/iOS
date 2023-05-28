//
//  ViewController.swift
//  Clone clock app
//
//  Created by 송영훈 on 2023/05/27.
//

import UIKit

class GlobalTimeViewController: UIViewController {
    
    // MARK: - Variable Area
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var noGlabalClockLabel: UILabel!
    @IBOutlet weak var globalClockTableView: UITableView!
    
    // MARK: - View Cycle Area
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultViewState()
    }
    
    // MARK: - Function Area
    func defaultViewState() {
        if true {
            // When list is empty
            editButton.isEnabled = false
            editButton.tintColor = .clear
            
            noGlabalClockLabel.isHidden = false
            globalClockTableView.backgroundColor = .clear
        }
    }

}

//extension GlobalTimeViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)ㅌ -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
