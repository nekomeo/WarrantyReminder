//
//  EditBillViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-07.
//

import UIKit

class EditBillViewController: UIViewController {
	let dataManager = DataManager.shared
	var sectionData: [SectionData] {
		return dataManager.sectionData
	}
	
	private let editBillContainerView: UIView = {
		let editBillContainerView = UIView()
		editBillContainerView.translatesAutoresizingMaskIntoConstraints = false
		editBillContainerView.backgroundColor = .systemCyan
		
		return editBillContainerView
	}()
	
	private let editBillTableView: UITableView = {
		let editBillTableView = UITableView()
		editBillTableView.translatesAutoresizingMaskIntoConstraints = false
		
		return editBillTableView
	}()
	
	private let deleteButton: UIButton = {
		let deleteButton = UIButton()
		deleteButton.translatesAutoresizingMaskIntoConstraints = false
		deleteButton.backgroundColor = .red
		deleteButton.setTitle("Delete", for: .normal)
		deleteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		deleteButton.layer.cornerRadius = 10
		
		return deleteButton
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemGray6
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didPressCancel))
		self.navigationItem.title = "Edit Bill"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didPressSave))
		
		self.view.addSubview(editBillContainerView)
		editBillContainerView.addSubview(editBillTableView)
		editBillContainerView.addSubview(deleteButton)
		
		editBillTableView.register(EditBillTableViewCell.self, forCellReuseIdentifier: EditBillTableViewCell.identifier)
		editBillTableView.delegate = self
		editBillTableView.dataSource = self
		
		deleteButton.addTarget(self, action: #selector(didPressDelete), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			editBillContainerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0.0),
			editBillContainerView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			editBillContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			editBillContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0)])
		
		NSLayoutConstraint.activate([
			editBillTableView.topAnchor.constraint(equalTo: editBillContainerView.topAnchor, constant: 0.0),
			editBillTableView.leadingAnchor.constraint(equalTo: editBillContainerView.leadingAnchor, constant: 0.0),
			editBillTableView.trailingAnchor.constraint(equalTo: editBillContainerView.trailingAnchor, constant: 0.0),
			editBillTableView.heightAnchor.constraint(equalToConstant: 380.0)])
		
		NSLayoutConstraint.activate([
			deleteButton.topAnchor.constraint(equalTo: editBillTableView.bottomAnchor, constant: 8.0),
			deleteButton.centerXAnchor.constraint(equalTo: editBillContainerView.centerXAnchor, constant: 0.0),
			deleteButton.widthAnchor.constraint(equalToConstant: 100.0)])
	}
	
	@objc func didPressCancel() {
		self.dismiss(animated: true)
	}
	
	@objc func didPressSave() {
		self.dismiss(animated: true)
	}
	
	@objc func didPressDelete() {
		self.dismiss(animated: true)
	}
	
}

extension EditBillViewController: UITableViewDataSource, UITableViewDelegate {
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
		guard let cell = tableView.dequeueReusableCell(withIdentifier: EditBillTableViewCell.identifier, for: indexPath) as? EditBillTableViewCell else {
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
