//
//  SecondViewController.swift
//  Introduction to IOS
//
//  Created by Anton MOLCHAN on 02.06.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import UIKit

class List: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var list: UITableView!
    
    let mas = ["Bar1", "Bar2", "Bar3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.delegate = self
        list.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = list.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = mas[indexPath.row]
        return cell!
    }

}

