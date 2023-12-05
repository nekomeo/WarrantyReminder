//
//  DueBillsTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-03-19.
//

import UIKit

class DueBillsTableViewCell: UITableViewCell {
	static let identifier = "DueBillsTableViewCell"
	
	private let checkmarkButton: UIButton = {
		let checkmarkButton = UIButton()
		
		checkmarkButton.layer.borderWidth = 1
		checkmarkButton.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
		
		return checkmarkButton
	}()
	
	private let billName: UILabel = {
		let billNameLabel = UILabel()
		billNameLabel.text = "Bill Name"
		
		return billNameLabel
	}()
	
	private let billType: UILabel = {
		let billTypeLabel = UILabel()
		billTypeLabel.text = "Shopping"
		
		return billTypeLabel
	}()
	
	private let billAmount: UILabel = {
		let billAmountLabel = UILabel()
		billAmountLabel.text = "$1.00"
		
		return billAmountLabel
	}()
	
	private let billDueDate: UILabel = {
		let billDueLabel = UILabel()
		billDueLabel.text = "Due in x days"
		
		return billDueLabel
	}()
	
	private let billRecurrence: UILabel = {
		let billRecurrenceLabel = UILabel()
		billRecurrenceLabel.text = "Every month"
		
		return billRecurrenceLabel
	}()
	
	private let label1: UILabel = {
		let v = UILabel()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = .yellow
		v.text = "Label 1"
		v.textAlignment = .center
		return v
	}()
	
	private let label2: UILabel = {
		let v = UILabel()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = .yellow
		v.text = "Label 2"
		v.textAlignment = .center
		return v
	}()
	
	private let label3: UILabel = {
		let v = UILabel()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = .yellow
		v.text = "Label 3"
		v.textAlignment = .center
		return v
	}()
	
	private let theStackView: UIStackView = {
		let v = UIStackView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.axis = .horizontal
		v.alignment = .center
		v.distribution = .fill
		v.spacing = 8
		return v
	}()
	
	func displayThings() {
		let stack1 = UIStackView(arrangedSubviews: [billName, billAmount])
		stack1.axis = .horizontal
		
		let stack2 = UIStackView(arrangedSubviews: [billType, billDueDate])
		stack2.axis = .horizontal
		
		let stack3 = UIStackView(arrangedSubviews: [billRecurrence])
		stack3.axis = .horizontal
		
		let mainStack = UIStackView(arrangedSubviews: [stack1, stack2, stack3])
		mainStack.axis = .vertical
		mainStack.distribution = .fillEqually
		mainStack.alignment = .fill
		mainStack.spacing = 5
		mainStack.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(mainStack)
		
		let viewsDictionary = ["mainStack": mainStack]
		let mainStack_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackView]-20-|",options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
		let mainStack_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[stackView]-30-|",options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
		
		contentView.addConstraints(mainStack_H)
		contentView.addConstraints(mainStack_V)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		//    contentView.addSubview(checkmarkButton)
		//    contentView.addSubview(billName)
		commonInit()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configure(text: String) {
		billName.text = text
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		billName.text = nil
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		//		displayThings()
		
		let detailButtonSize = contentView.frame.size.height
		
		billName.frame = CGRect(x: detailButtonSize / 2, y: 0, width: contentView.frame.size.width / 2, height: detailButtonSize)
		
		checkmarkButton.frame = CGRect(x: contentView.frame.size.width - detailButtonSize - 10, y: detailButtonSize / 6, width: detailButtonSize / 1.5, height: detailButtonSize / 1.5)
	}
	
	func commonInit() -> Void {
		
		backgroundColor = .systemMint
		
		theStackView.addArrangedSubview(label1)
		theStackView.addArrangedSubview(label2)
		theStackView.addArrangedSubview(label3)
		
		contentView.addSubview(theStackView)
		
		NSLayoutConstraint.activate([
			theStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
			theStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			theStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			theStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
		])
	}
}
