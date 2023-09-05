//
//  SettingsTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-09-04.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
	static let identifier = "SettingsTableViewCell"

	override func awakeFromNib() {
			super.awakeFromNib()
			// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
			super.setSelected(selected, animated: animated)

			// Configure the view for the selected state
	}
	
//	private let settingCellName: UILabel = {
//		let label = UILabel()
//		label.text = "ORIHO"
//
//		return label
//	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
//		contentView.addSubview(settingCellName)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
//	public func configure(text: String) {
//		settingCellName.text = text
//	}
//
//	override func prepareForReuse() {
//		super.prepareForReuse()
//
//		settingCellName.text = nil
//	}
}
