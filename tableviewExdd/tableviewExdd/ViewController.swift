//
//  ViewController.swift
//  tableviewExdd
//
//  Created by hong on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {
    
    
    var table = UITableView(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
    
    var items = ["TL","awtw","watawaw","aewtwtatw"]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(table)
        
        table.dataSource = self
        table.delegate = self
        
       
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}



