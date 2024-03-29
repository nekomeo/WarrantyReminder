//
//  AddBillViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-04.
//

import UIKit

class AddBillViewController: UIViewController {
	let dataManager = DataManager.shared
	var sectionData: [SectionData] {
		return dataManager.sectionData
	}
	
	private let addBillContainerView: UIView = {
		let addBillContainerView = UIView()
		addBillContainerView.translatesAutoresizingMaskIntoConstraints = false
		addBillContainerView.backgroundColor = .systemPurple
		
		return addBillContainerView
	}()
	
	private let addBillTableView: UITableView = {
		let addBillTableView = UITableView()
		addBillTableView.translatesAutoresizingMaskIntoConstraints = false
		
		return addBillTableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemGray6
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didPressCancel))
		self.navigationItem.title = "Add New Bill"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didPressSave))
		
		self.view.addSubview(addBillContainerView)
		addBillContainerView.addSubview(addBillTableView)
		
		addBillTableView.register(AddBillTableViewCell.self, forCellReuseIdentifier: AddBillTableViewCell.identifier)
		addBillTableView.delegate = self
		addBillTableView.dataSource = self
		
		NSLayoutConstraint.activate([
			addBillContainerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0.0),
			addBillContainerView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			addBillContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			addBillContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0)])
		
		NSLayoutConstraint.activate([
			addBillTableView.topAnchor.constraint(equalTo: addBillContainerView.topAnchor, constant: 0.0),
			addBillTableView.bottomAnchor.constraint(equalTo: addBillContainerView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			addBillTableView.leadingAnchor.constraint(equalTo: addBillContainerView.leadingAnchor, constant: 0.0),
			addBillTableView.trailingAnchor.constraint(equalTo: addBillContainerView.trailingAnchor, constant: 0.0)])
	}
	
	@objc func didPressCancel() {
		self.dismiss(animated: true)
	}
	
	@objc func didPressSave() {
		self.dismiss(animated: true)
	}
	
}

extension AddBillViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return sectionData.count
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		tableView.backgroundColor = .clear
		
		let sectionHeaderView = UIView()
		sectionHeaderView.translatesAutoresizingMaskIntoConstraints = false
		
		return sectionHeaderView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 8
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sectionData[section].rows.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: AddBillTableViewCell.identifier, for: indexPath) as? AddBillTableViewCell else {
			return UITableViewCell()
		}
		
		let dataForRow = sectionData[indexPath.section].rows[indexPath.row]
		cell.configure(with: dataForRow)
		
		if indexPath.section == 1 && dataForRow == "Auto Pay Bill" {
			cell.selectionStyle = .none
			cell.accessoryType = .none
		} else {
			cell.selectionStyle = .default
			cell.accessoryType = .disclosureIndicator
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let heightForRow = sectionData[indexPath.section].rows[indexPath.row]
		
		if heightForRow == "Amount" {
			return 65.0
		} else if heightForRow == "Date" {
			return 85.0
		} else {
			return 44.0
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
