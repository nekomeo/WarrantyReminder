//
//  SettingsViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class SettingsViewController: UIViewController {
	let settingsContainerView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200))
	
	let settingsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		self.view.backgroundColor = .green
		self.title = "Settings"

		settingsContainerView.addSubview(settingsTableView)
			
		settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
		settingsTableView.delegate = self
		settingsTableView.dataSource = self
			
		view.addSubview(settingsContainerView)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		settingsTableView.frame = settingsContainerView.bounds
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

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 7
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let sectionHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
		let sectionHeaderLabel = UILabel(frame: CGRect(x: 15, y: 0, width: sectionHeaderView.frame.width, height: 20))
		
		sectionHeaderLabel.backgroundColor = .clear
		sectionHeaderLabel.text = "Test"
		sectionHeaderView.addSubview(sectionHeaderLabel)
		
		tableView.addSubview(sectionHeaderView)
		
		return sectionHeaderView
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tableView.backgroundColor = .clear

		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath)

//		cell.configure(text: "\(indexPath.row+1)")
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
