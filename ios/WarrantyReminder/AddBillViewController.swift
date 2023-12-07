//
//  AddBillViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-04.
//

import UIKit

class AddBillViewController: UIViewController {
	private let addBillContainerView: UIView = {
		let view = UIView()
		view.backgroundColor = .systemMint
		
		return view
	}()
	
	private let addBillTableView: UITableView = {
		let view = UITableView()
		
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemGray6
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didPressCancel))
		self.navigationItem.title = "Add New Bill"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didPressSave))
		
		self.view.addSubview(addBillContainerView)
		addBillContainerView.addSubview(addBillTableView)
		
		addBillContainerView.translatesAutoresizingMaskIntoConstraints = false
		addBillTableView.translatesAutoresizingMaskIntoConstraints = false
		
		addBillTableView.register(AddBillTableViewCell.self, forCellReuseIdentifier: AddBillTableViewCell.identifier)
		addBillTableView.delegate = self
		addBillTableView.dataSource = self
		
		NSLayoutConstraint.activate([
			addBillContainerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0.0),
			addBillContainerView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			addBillContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			addBillContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0)])
		
		NSLayoutConstraint.activate([
			addBillTableView.topAnchor.constraint(equalTo: addBillContainerView.layoutMarginsGuide.topAnchor, constant: 0.0),
			addBillTableView.bottomAnchor.constraint(equalTo: addBillContainerView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			addBillTableView.leadingAnchor.constraint(equalTo: addBillContainerView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			addBillTableView.trailingAnchor.constraint(equalTo: addBillContainerView.layoutMarginsGuide.trailingAnchor, constant: 0.0)])
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
	
}

extension AddBillViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: AddBillTableViewCell.identifier, for: indexPath) as? AddBillTableViewCell else {
			return UITableViewCell()
		}
		
		return cell
	}
}
