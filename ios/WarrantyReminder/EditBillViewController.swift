//
//  EditBillViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-07.
//

import UIKit

class EditBillViewController: UIViewController {
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
			editBillTableView.topAnchor.constraint(equalTo: editBillContainerView.layoutMarginsGuide.topAnchor, constant: 0.0),
			//			editBillTableView.bottomAnchor.constraint(equalTo: editBillContainerView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			editBillTableView.leadingAnchor.constraint(equalTo: editBillContainerView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			editBillTableView.trailingAnchor.constraint(equalTo: editBillContainerView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
			editBillTableView.heightAnchor.constraint(equalToConstant: 300.0)])
		
		NSLayoutConstraint.activate([
			deleteButton.topAnchor.constraint(equalTo: editBillTableView.bottomAnchor, constant: 8.0),
			deleteButton.centerXAnchor.constraint(equalTo: editBillContainerView.centerXAnchor, constant: 0.0),
			deleteButton.widthAnchor.constraint(equalToConstant: 100.0)])
	}
	
	
	/*
	 // MARK: - Navigation
	 
	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	 // Get the new view controller using segue.destination.
	 // Pass the selected object to the new view controller.
	 }
	 */
	
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
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: EditBillTableViewCell.identifier, for: indexPath) as? EditBillTableViewCell else {
			return UITableViewCell()
		}
		
		return cell
	}
}
