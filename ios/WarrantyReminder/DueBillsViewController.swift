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
		
		dueBillsTableView.sectionHeaderTopPadding = 0
		upcomingBillsTableView.sectionHeaderTopPadding = 0
		nextBillsTableView.sectionHeaderTopPadding = 0
			
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
//	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//		switch tableView {
//			case dueBillsTableView:
//				return "Due Bills"
//			case upcomingBillsTableView:
//				return "Upcoming (2 Days)"
//			case nextBillsTableView:
//				return "Next 30 days"
//			default:
//				return ""
//		}
//	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let billSectionLabelView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))

		let billSectionLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.view.frame.size.width / 2, height: 20))
		billSectionLabel.textColor = .white
		billSectionLabel.font = UIFont.boldSystemFont(ofSize: 16)

		let numOfBillsLabel = UILabel(frame: CGRect(x: self.view.frame.size.width - 90, y: 10, width: self.view.frame.size.width / 2, height: 20))
		numOfBillsLabel.font = UIFont.systemFont(ofSize: 16)
		
		switch tableView {
			case dueBillsTableView:
				billSectionLabel.text = "\u{23F5} Overdue Bills"
			case upcomingBillsTableView:
				billSectionLabel.text = "\u{23F7} Upcoming (2 Days)"
			case nextBillsTableView:
				billSectionLabel.text = "\u{2714} Next 30 days"
			default:
				billSectionLabel.text = ""
		}
		
		numOfBillsLabel.text = "1 Bill $0.00"
		numOfBillsLabel.textColor = .white
		
		billSectionLabelView.addSubview(billSectionLabel)
		billSectionLabelView.addSubview(numOfBillsLabel)

		return billSectionLabelView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 40
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
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
