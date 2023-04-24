//
//  TabTwoViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class TabTwoViewController: UIViewController {
	
	let calendarView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200))
	let tableView = UIView(frame: CGRect(x: 0, y: 310, width: UIScreen.main.bounds.width, height: 200))

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = UIColor.systemPurple
			
//		tableView.translatesAutoresizingMaskIntoConstraints = false
//		tableView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 0).isActive = true
//		tableView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -100).isActive = true
//		tableView.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor, constant: 0).isActive = true
//		tableView.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor, constant: 0).isActive = true
			
		calendarView.backgroundColor = .white
		tableView.backgroundColor = .systemCyan
		self.title = "Calendar"
			
		view.addSubview(calendarView)
		view.addSubview(tableView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
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

extension TabTwoViewController: UITableViewDataSource, UITableViewDelegate {
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
