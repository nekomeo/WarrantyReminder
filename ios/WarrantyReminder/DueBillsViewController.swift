//
//  DueBillsViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class DueBillsViewController: UIViewController {

	private let editButton: UIBarButtonItem = {
		let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: Any?.self, action: #selector(didPressEdit))
		return editButton
	}()

	private let addButton: UIBarButtonItem = {
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: Any?.self, action: #selector(didPressAdd))
		return addButton
	}()

//	let containerView = UIView(frame: UIScreen.main.bounds)
	let dueBillsContainerView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200))
	let upcomingBillsContainerView = UIView(frame: CGRect(x: 0, y: 310, width: UIScreen.main.bounds.width, height: 200))
	let nextBillsContainerView = UIView(frame: CGRect(x: 0, y: 520, width: UIScreen.main.bounds.width, height: 200))
	
	let dueBillsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
	let upcomingBillsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
	let nextBillsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = UIColor.systemCyan
		self.title = "Due Bills"
		
		dueBillsTableView.backgroundColor = .red
		upcomingBillsTableView.backgroundColor = .orange
		nextBillsTableView.backgroundColor = .blue
		
		
		dueBillsContainerView.addSubview(dueBillsTableView)
		upcomingBillsContainerView.addSubview(upcomingBillsTableView)
		nextBillsContainerView.addSubview(nextBillsTableView)
			
		dueBillsTableView.register(DueBillsTableViewCell.self, forCellReuseIdentifier: DueBillsTableViewCell.identifier)
		dueBillsTableView.delegate = self
		dueBillsTableView.dataSource = self
		
		upcomingBillsTableView.register(DueBillsTableViewCell.self, forCellReuseIdentifier: DueBillsTableViewCell.identifier)
		upcomingBillsTableView.delegate = self
		upcomingBillsTableView.dataSource = self
		
		nextBillsTableView.register(DueBillsTableViewCell.self, forCellReuseIdentifier: DueBillsTableViewCell.identifier)
		nextBillsTableView.delegate = self
		nextBillsTableView.dataSource = self
		
		view.addSubview(dueBillsContainerView)
		view.addSubview(upcomingBillsContainerView)
		view.addSubview(nextBillsContainerView)
			
		self.navigationItem.leftBarButtonItem = editButton
		self.navigationItem.rightBarButtonItem = addButton
	}
  
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		dueBillsTableView.frame = dueBillsContainerView.bounds
		upcomingBillsTableView.frame = upcomingBillsContainerView.bounds
		nextBillsTableView.frame = nextBillsContainerView.bounds
	}
	
	@objc func didPressAdd() {
		print("Add button pressed")
	}
	
	@objc func didPressEdit() {
		print("Edit button pressed")
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

extension DueBillsViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch tableView {
			case dueBillsTableView:
				return "Due Bills"
			case upcomingBillsTableView:
				return "Upcoming (2 Days)"
			case nextBillsTableView:
				return "Next 30 days"
			default:
				return ""
		}
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let sectionLabel = UILabel()
		sectionLabel.textColor = .white
		
		switch tableView {
			case dueBillsTableView:
				sectionLabel.text = "Overdue Bills"
			case upcomingBillsTableView:
				sectionLabel.text = "Upcoming (2 Days)"
			case nextBillsTableView:
				sectionLabel.text = "Next 30 days"
			default:
				sectionLabel.text = ""
		}

		return sectionLabel
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: DueBillsTableViewCell.identifier, for: indexPath) as? DueBillsTableViewCell else {
			return UITableViewCell()
		}
		
		cell.configure(text: "Due Bill \(indexPath.row+1)")
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
