//
//  DueBillsViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class DueBillsViewController: UIViewController {
	private let dueBillsContainerView: UIView = {
		let dueBillsContainerView = UIView()
		dueBillsContainerView.translatesAutoresizingMaskIntoConstraints = false
		
		return dueBillsContainerView
	}()
	private let upcomingBillsContainerView: UIView = {
		let upcomingBillsContainerView = UIView()
		upcomingBillsContainerView.translatesAutoresizingMaskIntoConstraints = false
		
		return upcomingBillsContainerView
	}()
	private let nextBillsContainerView: UIView = {
		let nextBillsContainerView = UIView()
		nextBillsContainerView.translatesAutoresizingMaskIntoConstraints = false
		
		return nextBillsContainerView
	}()
	
	private let dueBillsTableView: UITableView = {
		let dueBillsTableView = UITableView()
		dueBillsTableView.translatesAutoresizingMaskIntoConstraints = false
		dueBillsTableView.sectionHeaderTopPadding = 0
		dueBillsTableView.backgroundColor = .red
		
		return dueBillsTableView
	}()
	private let upcomingBillsTableView: UITableView = {
		let upcomingBillsTableView = UITableView()
		upcomingBillsTableView.translatesAutoresizingMaskIntoConstraints = false
		upcomingBillsTableView.sectionHeaderTopPadding = 0
		upcomingBillsTableView.backgroundColor = .orange
		
		return upcomingBillsTableView
	}()
	private let nextBillsTableView: UITableView = {
		let nextBillsTableView = UITableView()
		nextBillsTableView.translatesAutoresizingMaskIntoConstraints = false
		nextBillsTableView.sectionHeaderTopPadding = 0
		nextBillsTableView.backgroundColor = .blue
		
		return nextBillsTableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemGray6
		self.title = "Due Bills"
		
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didPressEdit))
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAdd))
		
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
		
		self.view.addSubview(dueBillsContainerView)
		self.view.addSubview(upcomingBillsContainerView)
		self.view.addSubview(nextBillsContainerView)
		
		layoutConstraints()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	private func layoutConstraints() {
		NSLayoutConstraint.activate([
			dueBillsContainerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0.0),
			dueBillsContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			dueBillsContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
			dueBillsContainerView.heightAnchor.constraint(equalToConstant: 200)])
		
		NSLayoutConstraint.activate([
			dueBillsTableView.topAnchor.constraint(equalTo: dueBillsContainerView.topAnchor, constant: 0.0),
			dueBillsTableView.bottomAnchor.constraint(equalTo: dueBillsContainerView.bottomAnchor, constant: 0.0),
			dueBillsTableView.leadingAnchor.constraint(equalTo: dueBillsContainerView.leadingAnchor, constant: 0.0),
			dueBillsTableView.trailingAnchor.constraint(equalTo: dueBillsContainerView.trailingAnchor, constant: 0.0)])
		
		NSLayoutConstraint.activate([
			upcomingBillsContainerView.topAnchor.constraint(equalTo: dueBillsContainerView.bottomAnchor, constant: 0.0),
			upcomingBillsContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			upcomingBillsContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
			upcomingBillsContainerView.heightAnchor.constraint(equalToConstant: 200)])
		
		NSLayoutConstraint.activate([
			upcomingBillsTableView.topAnchor.constraint(equalTo: upcomingBillsContainerView.topAnchor, constant: 0.0),
			upcomingBillsTableView.bottomAnchor.constraint(equalTo: upcomingBillsContainerView.bottomAnchor, constant: 0.0),
			upcomingBillsTableView.leadingAnchor.constraint(equalTo: upcomingBillsContainerView.leadingAnchor, constant: 0.0),
			upcomingBillsTableView.trailingAnchor.constraint(equalTo: upcomingBillsContainerView.trailingAnchor, constant: 0.0)])
		
		NSLayoutConstraint.activate([
			nextBillsContainerView.topAnchor.constraint(equalTo: upcomingBillsContainerView.bottomAnchor, constant: 0.0),
			nextBillsContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			nextBillsContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
			nextBillsContainerView.heightAnchor.constraint(equalToConstant: 200)])
		
		NSLayoutConstraint.activate([
			nextBillsTableView.topAnchor.constraint(equalTo: nextBillsContainerView.topAnchor, constant: 0.0),
			nextBillsTableView.bottomAnchor.constraint(equalTo: nextBillsContainerView.bottomAnchor, constant: 0.0),
			nextBillsTableView.leadingAnchor.constraint(equalTo: nextBillsContainerView.leadingAnchor, constant: 0.0),
			nextBillsTableView.trailingAnchor.constraint(equalTo: nextBillsContainerView.trailingAnchor, constant: 0.0)])
	}
	
	@objc func didPressAdd() {
		let addBillVC = AddBillViewController()
		let navController = UINavigationController(rootViewController: addBillVC)
		
		navController.modalPresentationStyle = .fullScreen
		present(navController, animated: true)
	}
	
	@objc func didPressEdit() {
		print("Edit button pressed")
	}
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
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: DueBillsTableViewCell.identifier, for: indexPath) as? DueBillsTableViewCell else {
			return UITableViewCell()
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let editVC = EditBillViewController()
		let navController = UINavigationController(rootViewController: editVC)
		navController.modalPresentationStyle = .fullScreen
		present(navController, animated: true)
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
