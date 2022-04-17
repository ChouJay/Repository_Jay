//
//  ViewController.swift
//  HW week4
//
//  Created by Jay Chou on 2022/4/14.
//

import UIKit
//UITableViewController are already set up to adopt the UITableViewDataSourceProtocol
class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = 100
    }
    
    //MARK: DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homework4", for: indexPath)
        let label = Label(title: "This is section \(indexPath.section), row \(indexPath.row)")
        cell.textLabel?.text = label.title
        return cell
    }


}

