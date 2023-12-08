//
//  AddBillViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-04.
//

import UIKit

struct AddBillSection {
	var sectionNames: [String]
}

class AddBillViewController: UIViewController {
	private var addBillSections: [AddBillSection] = [
		AddBillSection(sectionNames: ["Bill Name", "Category"]),
		AddBillSection(sectionNames: ["Amount", "Auto Pay Bill"]),
		AddBillSection(sectionNames: ["Date", "Notes"])]
	
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
		return self.addBillSections.count
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
		return self.addBillSections[section].sectionNames.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: AddBillTableViewCell.identifier, for: indexPath) as? AddBillTableViewCell else {
			return UITableViewCell()
		}
		
		let title = self.addBillSections[indexPath.section].sectionNames[indexPath.row]
		cell.textLabel?.text = title
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
