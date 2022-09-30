//
//  ViewController.swift
//  Weather
//
//  Created by 송영훈 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하", ]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var dates: [Date] = []
    
    let dateFormatrer: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter
    }()
    let timeFormatrer: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        
        return formatter
    }()
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        dates.append(Date())
        
        self.TableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.TableView.delegate = self
        self.TableView.dataSource = self
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            
            return cell
        } else {
            // 강제 캐스팅 사용
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel.text = self.dateFormatrer.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormatrer.string(from: self.dates[indexPath.row])
            
            return cell
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 { return section == 0 ? "한글" : "영어" }
         return nil
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            // 캐스팅에 실패하면 쓸 필요가 없기에 return
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        nextViewController.textToSet = cell.textLabel?.text
        /*
         nextViewController.textLabel.text = cell.textLabel?.text
         위와 같은 방법은 메모리에 다음 뷰의 보여줘야 되는 부분을
         아직 올리지 않았기 때문에 인식이 안되며 값도 마찬가지
         하지만 보여지짖 않는 부분이라면(textToSet) 사용가능
         */

    }
    
}

