//
//  TabOneViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class TabOneViewController: UIViewController {
	
	let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//	let testView = UIView(frame: UIScreen.main.bounds)
	let testView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))

    override func viewDidLoad() {
        super.viewDidLoad()

			self.view.backgroundColor = UIColor.systemCyan
			self.title = "Tab 1"
			
			view.addSubview(testView)
			testView.addSubview(tableView)
			
			tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
			tableView.delegate = self
			tableView.dataSource = self
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		tableView.frame = testView.bounds
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

extension TabOneViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Due Bills"
	}
	
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
