//
//  ViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-02-07.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  let tableView = UITableView()
  var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      for x in 0...11 {
        data.append("Some data \(x)")
      }
      
      view.addSubview(tableView)

      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      tableView.delegate = self
      tableView.dataSource = self
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    cell.textLabel?.text = data[indexPath.row]
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    print("cell \(indexPath.row) tapped")
  }

}

