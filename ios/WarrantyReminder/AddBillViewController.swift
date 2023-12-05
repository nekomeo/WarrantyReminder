//
//  AddBillViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-04.
//

import UIKit

class AddBillViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemRed
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didPressCancel))
		self.navigationItem.title = "Add New Bill"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didPressSave))
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
