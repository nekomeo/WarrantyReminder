//
//  ViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-02-07.
//

import UIKit

class ViewController: UIViewController {
	
	private let button: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
		button.setTitle("Hello", for: .normal)
		button.backgroundColor = .white
		button.setTitleColor(.black, for: .normal)
		return button
	}()

  let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
			
			view.backgroundColor = .systemMint
			view.addSubview(button)
			button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
		button.center = view.center
  }
	
	@objc func didTapButton() {
		let tabBarVC = TabViewController()
		
		let vc1 = UINavigationController(rootViewController: TabOneViewController())
		let vc2 = UINavigationController(rootViewController: TabTwoViewController())
		let vc3 = UINavigationController(rootViewController: TabThreeViewController())
		
		vc1.title = "Tab 1"
		vc2.title = "Tab 2"
		vc3.title = "Tab 3"
		
		tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
		
		guard let items = tabBarVC.tabBar.items else { return }
		
		let images = ["folder", "calendar", "gear"]

		for x in 0..<items.count {
			items[x].image = UIImage(systemName: images[x])
		}

		tabBarVC.modalPresentationStyle = .fullScreen
		
		tabBarVC.modalPresentationStyle = .fullScreen
		present(tabBarVC, animated: true)
	}
}
