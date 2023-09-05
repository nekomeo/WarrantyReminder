//
//  SettingsViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class MobileBrand {
	var brandName: String?
	var modelName: [String]?
	
	init(brandName: String, modelName: [String]) {
		self.brandName = brandName
		self.modelName = modelName
	}
}

class SettingsViewController: UIViewController {
	let settingsContainerView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200))
	
	let settingsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
	var mobileBrand = [MobileBrand]()

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		self.view.backgroundColor = .green
		self.title = "Settings"
		
		mobileBrand.append(MobileBrand.init(brandName: "Apple", modelName: ["iPhone 5s","iPhone 6","iPhone 6s", "iPhone 7+", "iPhone 8", "iPhone 8+", "iPhone 11", "iPhone 11 Pro"]))
		mobileBrand.append(MobileBrand.init(brandName: "Samsung", modelName: ["Samsung M Series", "Samsung Galaxy Note 9", "Samsung Galaxy Note 9+", "Samsung Galaxy Note 10", "Samsung Galaxy Note 10 +"]))
		mobileBrand.append(MobileBrand.init(brandName: "Mi", modelName: ["Mi Note 7", "Mi Note 7 Pro", "Mi K20"]))
		mobileBrand.append(MobileBrand.init(brandName: "Huawei", modelName: ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))

		settingsContainerView.addSubview(settingsTableView)
		
		settingsTableView.sectionHeaderTopPadding = 0
			
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
		return mobileBrand.count
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let sectionHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
		let sectionHeaderLabel = UILabel(frame: CGRect(x: 10, y: 0, width: sectionHeaderView.frame.width, height: sectionHeaderView.frame.height))
		
		sectionHeaderLabel.text = mobileBrand[section].brandName
		sectionHeaderView.addSubview(sectionHeaderLabel)
//		sectionHeaderView.backgroundColor = .purple
		
		tableView.addSubview(sectionHeaderView)
		
		return sectionHeaderView
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tableView.backgroundColor = .clear

		return mobileBrand[section].modelName?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath)
		
		cell.textLabel?.text = mobileBrand[indexPath.section].modelName?[indexPath.row]
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
