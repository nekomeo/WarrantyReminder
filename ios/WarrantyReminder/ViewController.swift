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
		
		bottomTabBarVC.tabBar.backgroundColor = .darkGray
		bottomTabBarVC.modalPresentationStyle = .fullScreen
		present(bottomTabBarVC, animated: true)
	}
}
