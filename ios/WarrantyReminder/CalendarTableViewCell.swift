//
//  CalendarTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-11-30.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
	static let identifier = "CalendarTableViewCell"
	
	// MARK: - UI Components
	private let checkmarkButton: UIButton = {
		let checkmarkButton = UIButton()
		checkmarkButton.translatesAutoresizingMaskIntoConstraints = false
		
		checkmarkButton.layer.borderWidth = 1
		checkmarkButton.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
		
		return checkmarkButton
	}()
	
	private let calendarBillName: UILabel = {
		let calendarBillNameLabel = UILabel()
		calendarBillNameLabel.translatesAutoresizingMaskIntoConstraints = false
		calendarBillNameLabel.text = "Bill name"
		calendarBillNameLabel.textAlignment = .left
		
		return calendarBillNameLabel
	}()
	
	private let calendarBillType: UILabel = {
		let calendarBillTypeLabel = UILabel()
		calendarBillTypeLabel.translatesAutoresizingMaskIntoConstraints = false
		calendarBillTypeLabel.text = "Bill type"
		calendarBillTypeLabel.textAlignment = .left
		
		return calendarBillTypeLabel
	}()
	
	private let calendarBillAmount: UILabel = {
		let calendarBillAmountLabel = UILabel()
		calendarBillAmountLabel.translatesAutoresizingMaskIntoConstraints = false
		calendarBillAmountLabel.font = UIFont.boldSystemFont(ofSize: 16)
		calendarBillAmountLabel.text = "$1.00"
		calendarBillAmountLabel.textAlignment = .right
		
		return calendarBillAmountLabel
	}()
	
	private let calendarBillDueDate: UILabel = {
		let calendarBillDueLabel = UILabel()
		calendarBillDueLabel.translatesAutoresizingMaskIntoConstraints = false
		calendarBillDueLabel.text = "Due in 2 days (Tue)"
		calendarBillDueLabel.textAlignment = .right
		
		return calendarBillDueLabel
	}()
	
	private let calendarBillRecurrence: UILabel = {
		let calendarBillRecurrenceLabel = UILabel()
		calendarBillRecurrenceLabel.translatesAutoresizingMaskIntoConstraints = false
		calendarBillRecurrenceLabel.text = "Once"
		calendarBillRecurrenceLabel.textAlignment = .right
		
		return calendarBillRecurrenceLabel
	}()
	
	// MARK: - StackViews
	
	private let mainStackView: UIStackView = {
		let mainStack = UIStackView()
		
		mainStack.translatesAutoresizingMaskIntoConstraints = false
		mainStack.axis = .horizontal
		mainStack.distribution = .fill
		//		mainStack.spacing = 8
		
		return mainStack
	}()
	
	private let hStackView1: UIStackView = {
		let hStack1 = UIStackView()
		
		hStack1.translatesAutoresizingMaskIntoConstraints = false
		hStack1.axis = .horizontal
		hStack1.distribution = .fillProportionally
		hStack1.spacing = 8
		
		return hStack1
	}()
	
	private let hStackView2: UIStackView = {
		let hStack2 = UIStackView()
		
		hStack2.translatesAutoresizingMaskIntoConstraints = false
		hStack2.axis = .horizontal
		hStack2.distribution = .fillProportionally
		hStack2.spacing = 8
		
		return hStack2
	}()
	
	private let hStackView3: UIStackView = {
		let hStack3 = UIStackView()
		
		hStack3.translatesAutoresizingMaskIntoConstraints = false
		hStack3.axis = .horizontal
		hStack3.spacing = 8
		
		return hStack3
	}()
	
	private let vStackView: UIStackView = {
		let verticalStack = UIStackView()
		
		verticalStack.translatesAutoresizingMaskIntoConstraints = false
		verticalStack.axis = .vertical
		verticalStack.alignment = .trailing
		verticalStack.distribution = .fill
		verticalStack.spacing = 4
		
		return verticalStack
	}()
	
	// MARK: -
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
		
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configure(text: String) {
		//		calendarBillName.text = text
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		//		calendarBillName.text = nil
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let checkmarkButtonSize = contentView.frame.size.height
		
		checkmarkButton.frame = CGRect(x: checkmarkButtonSize / 6, y: checkmarkButtonSize / 6, width: checkmarkButtonSize, height: checkmarkButtonSize)
		
		calendarBillAmount.textColor = .init(red: 0.138, green: 0.008, blue: 0.854, alpha: 1.0)
	}
	
	private func commonInit() -> Void {
		mainStackView.addArrangedSubview(checkmarkButton)
		mainStackView.addArrangedSubview(vStackView)
		
		hStackView1.addArrangedSubview(calendarBillName)
		hStackView1.addArrangedSubview(calendarBillAmount)
		
		hStackView2.addArrangedSubview(calendarBillType)
		hStackView2.addArrangedSubview(calendarBillDueDate)
		
		hStackView3.addArrangedSubview(calendarBillRecurrence)
		
		vStackView.addArrangedSubview(hStackView1)
		vStackView.addArrangedSubview(hStackView2)
		vStackView.addArrangedSubview(hStackView3)
		
		contentView.addSubview(mainStackView)
		
		NSLayoutConstraint.activate([
			mainStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
			mainStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			mainStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: -10.0),
			mainStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 10.0)])
		
		NSLayoutConstraint.activate([
			vStackView.topAnchor.constraint(equalTo: mainStackView.layoutMarginsGuide.topAnchor, constant: 0.0),
			vStackView.bottomAnchor.constraint(equalTo: mainStackView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			vStackView.trailingAnchor.constraint(equalTo: mainStackView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
			vStackView.widthAnchor.constraint(equalToConstant: 300)])
		
		NSLayoutConstraint.activate([
			hStackView1.topAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.topAnchor, constant: 0.0),
			hStackView1.leadingAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			hStackView1.trailingAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
			hStackView1.widthAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.widthAnchor)])
		
		NSLayoutConstraint.activate([
			hStackView2.topAnchor.constraint(equalTo: hStackView1.layoutMarginsGuide.bottomAnchor, constant: 4.0),
			hStackView2.leadingAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			hStackView2.trailingAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
			hStackView2.widthAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.widthAnchor)])
		
		NSLayoutConstraint.activate([
			hStackView3.topAnchor.constraint(equalTo: hStackView2.layoutMarginsGuide.bottomAnchor, constant: 4.0),
			hStackView3.leadingAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			hStackView3.trailingAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
			hStackView3.widthAnchor.constraint(equalTo: vStackView.layoutMarginsGuide.widthAnchor)])
	}
}
