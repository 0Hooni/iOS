//
//  AddCountryViewController.swift
//  Clone clock app
//
//  Created by 송영훈 on 2023/05/28.
//

import UIKit

class AddCountryViewController: UIViewController {
    
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerSeachBar: UISearchBar!
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.frame.size.height = headerTitleLabel.frame.height + headerSeachBar.frame.height
        
    }

}

