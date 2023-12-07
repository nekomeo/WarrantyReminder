//
//  BottomTabViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit

class BottomTabViewController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let home = self.createNav(with: "Due Bills", and: UIImage(systemName: "folder"), viewController: DueBillsViewController())
		let calendar = self.createNav(with: "Calendar", and: UIImage(systemName: "calendar"), viewController: CalendarViewController())
		let settings = self.createNav(with: "Settings", and: UIImage(systemName: "gear"), viewController: SettingsViewController())
		
		self.setViewControllers([home, calendar, settings], animated: true)
		self.tabBar.barTintColor = .darkGray
		self.tabBar.tintColor = .white
	}
	
	private func createNav(with title: String, and image: UIImage?, viewController: UIViewController) -> UINavigationController {
		let navigation = UINavigationController(rootViewController: viewController)
		
		navigation.tabBarItem.title = title
		navigation.tabBarItem.image = image
		
		return navigation
	}
}
