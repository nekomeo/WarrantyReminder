//
//  EditBillTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-07.
//

import UIKit

class EditBillTableViewCell: UITableViewCell {
	static let identifier = "EditBillTableViewCell"
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with data: String) {
		textLabel?.text = data
	}
}
