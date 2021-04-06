//
//  ViewController.swift
//  SimpleTable
//
//  Created by 김민창 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIndentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()

    @IBAction func touchUpAddButton(_ sender: UIButton) {
        dates.append(Date())
        
        //self.tableView.reloadData()
        //전체의 데이터를 다 가져오기 떄문에 비효율적
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        //코드로 연결
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
    }//섹션에 해당하는 row의 개수가 몇개가 되어야 하는지
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndentifier, for: indexPath)
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            return cell
        }else{
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            //위를 보면 강제 캐스팅을 하고 있는데 더 좋은 방법이 있으니 찾아볼것.
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            
            return cell
        }
        
    }//해당 로우에 맞는 셀을 돌려달라는 것
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            if section == 0 { return "한글" }
            else { return "영어" }
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}

