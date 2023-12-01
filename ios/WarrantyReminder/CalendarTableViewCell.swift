//
//  CalendarTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-11-30.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
	static let identifier = "CalendarTableViewCell"
	
	private let checkmarkButton: UIButton = {
		let checkmarkButton = UIButton()
		
		checkmarkButton.layer.borderWidth = 1
		checkmarkButton.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
		
		return checkmarkButton
	}()
	
	private let calendarBillName: UILabel = {
		let calendarBillLabel = UILabel()
		calendarBillLabel.text = "Item"
		
		return calendarBillLabel
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(checkmarkButton)
		contentView.addSubview(calendarBillName)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configure(text: String) {
		calendarBillName.text = text
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		calendarBillName.text = nil
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let checkmarkButtonSize = contentView.frame.size.height
		
		calendarBillName.frame = CGRect(x: checkmarkButtonSize / 2, y: 0, width: contentView.frame.size.width / 2, height: checkmarkButtonSize)
		
		checkmarkButton.frame = CGRect(x: contentView.frame.size.width - checkmarkButtonSize - 10, y: checkmarkButtonSize / 6, width: checkmarkButtonSize / 1.5, height: checkmarkButtonSize / 1.5)
	}
}
