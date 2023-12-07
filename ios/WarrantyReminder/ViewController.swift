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
		button.layer.cornerRadius = 10
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		helloButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
		helloButton.center = self.view.center
		
		self.view.backgroundColor = .systemMint
		self.view.addSubview(helloButton)
	}
	
	@objc func didTapButton() {
		let bottomTabBarVC = BottomTabViewController()
		
		bottomTabBarVC.tabBar.backgroundColor = .darkGray
		bottomTabBarVC.modalPresentationStyle = .fullScreen
		present(bottomTabBarVC, animated: true)
	}
}
