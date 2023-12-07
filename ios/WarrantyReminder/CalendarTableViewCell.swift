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
		let calendarBillNameLabel = UILabel()
		calendarBillNameLabel.text = "Bill name"
		
		return calendarBillNameLabel
	}()
	
	private let calendarBillType: UILabel = {
		let calendarBillTypeLabel = UILabel()
		calendarBillTypeLabel.text = "Bill type"
		
		return calendarBillTypeLabel
	}()
	
	private let calendarBillAmount: UILabel = {
		let calendarBillAmountLabel = UILabel()
		calendarBillAmountLabel.font = UIFont.boldSystemFont(ofSize: 16)
		calendarBillAmountLabel.text = "$1.00"
		
		return calendarBillAmountLabel
	}()
	
	private let calendarBillDueDate: UILabel = {
		let calendarBillDueLabel = UILabel()
		calendarBillDueLabel.text = "Due in x days"
		
		return calendarBillDueLabel
	}()
	
	private let calendarBillRecurrence: UILabel = {
		let calendarBillRecurrenceLabel = UILabel()
		calendarBillRecurrenceLabel.text = "Once"
		
		return calendarBillRecurrenceLabel
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let firstRow = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 20))
		let secondRow = UIView(frame: CGRect(x: 0, y: 20, width: 400, height: 20))
		let thirdRow = UIView(frame: CGRect(x: 0, y: 40, width: 400, height: 20))

		contentView.addSubview(checkmarkButton)
		contentView.addSubview(firstRow)
		contentView.addSubview(secondRow)
		contentView.addSubview(thirdRow)

		firstRow.addSubview(calendarBillName)
		firstRow.addSubview(calendarBillAmount)
		
		secondRow.addSubview(calendarBillType)
		secondRow.addSubview(calendarBillDueDate)
		
		thirdRow.addSubview(calendarBillRecurrence)
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

		checkmarkButton.frame = CGRect(x: checkmarkButtonSize / 6, y: checkmarkButtonSize / 6, width: checkmarkButtonSize, height: checkmarkButtonSize)
		
		calendarBillName.frame = CGRect(x: checkmarkButtonSize * 2, y: 0, width: contentView.frame.size.width / 2, height: checkmarkButtonSize)
		calendarBillAmount.frame = CGRect(x: 200, y: 0, width: 50, height: checkmarkButtonSize)
		
		calendarBillType.frame = CGRect(x: checkmarkButtonSize * 2, y: 20, width: 100, height: 20)
		calendarBillDueDate.frame = CGRect(x: 200, y: 20, width: 100, height: 20)
		
		calendarBillRecurrence.frame = CGRect(x: 200, y: 25, width: 100, height: 20)
	}
}
