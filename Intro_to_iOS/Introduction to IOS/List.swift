//
//  List.swift
//  Introduction to IOS
//
//  Created by Anton MOLCHAN on 6/3/18.
//  Copyright © 2018 Anton. All rights reserved.
//

import UIKit

class List: UITableViewController {

    @IBOutlet var list: UITableView!
    
    let mas = ["Unit 42", "Unit 42 France", "Random Place"]
    var sendIndex = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        list.delegate = self
        list.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = list.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = mas[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        sendIndex = indexPath.row
        performSegue(withIdentifier: "CellToMap", sender: cell)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapWithData {
            destination.index = sendIndex
        }
    }

    
    
}
