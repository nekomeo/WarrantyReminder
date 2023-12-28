//
//  AddBillTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-06.
//

import UIKit

class AddBillTableViewCell: UITableViewCell {
	static let identifier = "AddBillTableViewCell"
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	private let autoPaySwitch: UISwitch = {
		let autoPaySwitch = UISwitch()
		autoPaySwitch.translatesAutoresizingMaskIntoConstraints = false
		autoPaySwitch.isOn = false
		autoPaySwitch.addTarget(identifier.self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
		
		return autoPaySwitch
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with data: String) {
		textLabel?.text = data
		
		// Remove the switchControl if it's already added
		autoPaySwitch.removeFromSuperview()
		
		if data == "Auto Pay Bill" {
			contentView.addSubview(autoPaySwitch)
			
			NSLayoutConstraint.activate([
				autoPaySwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				autoPaySwitch.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
			])
		}
	}
	
	@objc private func switchValueChanged(_ sender: UISwitch) {
		if sender.isOn {
			print("Switch is ON")
		} else {
			print("Switch is OFF")
		}
	}
	
}
