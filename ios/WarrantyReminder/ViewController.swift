//
//  ViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-02-07.
//

import UIKit

class ViewController: UIViewController {
	
	private let helloButton: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
		button.setTitle("Hello", for: .normal)
		button.backgroundColor = .white
		button.setTitleColor(.black, for: .normal)
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.systemMint.cgColor
		button.layer.cornerRadius = 10
		return button
	}()

  let tableView = UITableView()

	override func viewDidLoad() {
		super.viewDidLoad()

		helloButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

		view.backgroundColor = .systemMint
		view.addSubview(helloButton)
	}

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
		helloButton.center = view.center
  }
	
	@objc func didTapButton() {
		let bottomTabBarVC = BottomTabViewController()
		
		let vc1 = UINavigationController(rootViewController: DueBillsViewController())
		let vc2 = UINavigationController(rootViewController: CalendarViewController())
		let vc3 = UINavigationController(rootViewController: SettingsViewController())
		
		vc1.title = "Tab 1"
		vc2.title = "Tab 2"
		vc3.title = "Tab 3"
		
		bottomTabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
		
		guard let items = bottomTabBarVC.tabBar.items else { return }
		
		let images = ["folder", "calendar", "gear"]

		for x in 0..<items.count {
			items[x].image = UIImage(systemName: images[x])
		}

		bottomTabBarVC.modalPresentationStyle = .fullScreen
		
		bottomTabBarVC.modalPresentationStyle = .fullScreen
		present(bottomTabBarVC, animated: true)
	}
}
