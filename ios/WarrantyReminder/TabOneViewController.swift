//
//  TabOneViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class TabOneViewController: UIViewController {
	
	private let addButton: UIBarButtonItem = {
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: Any?.self, action: #selector(didPressAdd))
		return addButton
	}()
	
	private let editButton: UIBarButtonItem = {
		let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: Any?.self, action: #selector(didPressEdit))
		return editButton
	}()

//	let containerView = UIView(frame: UIScreen.main.bounds)
	let containerView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 400))
	let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = UIColor.systemCyan
		self.title = "Due Bills"
			
		view.addSubview(containerView)
		containerView.addSubview(tableView)
			
		tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
		tableView.delegate = self
		tableView.dataSource = self
			
		self.navigationItem.rightBarButtonItem = addButton
		self.navigationItem.leftBarButtonItem = editButton
	}
  
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		tableView.frame = containerView.bounds
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
