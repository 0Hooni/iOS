//
//  SecondViewController.swift
//  Weather
//
//  Created by 송영훈 on 2022/09/26.
//

import UIKit

class SecondViewController: UIViewController {

    var textToSet: String?
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.textLabel.text = self.textToSet
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
