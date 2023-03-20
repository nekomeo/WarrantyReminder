//
//  ViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-02-07.
//

import UIKit

class ViewController: UIViewController {

  let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      view.addSubview(tableView)

      tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
      tableView.delegate = self
      tableView.dataSource = self
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else {
      return UITableViewCell()
    }
    cell.configure(text: "Custom \(indexPath.row+1)")
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
