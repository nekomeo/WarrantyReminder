//
//  DueBillsTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-03-19.
//

import UIKit

class DueBillsTableViewCell: UITableViewCell {
	static let identifier = "DueBillsTableViewCell"
	
	//  private let checkmarkButton: UIButton = {
	//		let detailButtonSize = contentView.frame.size.height
	//    let checkmarkButton = UIButton(frame: CGRect(x: contentView.frame.size.width - detailButtonSize - 10, y: detailButtonSize / 6, width: detailButtonSize / 1.5, height: detailButtonSize / 1.5))
	//
	//    checkmarkButton.layer.borderWidth = 1
	//    checkmarkButton.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
	//
	//    return checkmarkButton
	//  }()
	private var checkbox: UIButton {
		let detailButtonSize = contentView.frame.size.height
		let checkboxButton = UIButton(frame: CGRect(x: contentView.frame.size.width - detailButtonSize - 10, y: detailButtonSize / 6, width: 50, height: detailButtonSize / 1.5))
		checkboxButton.backgroundColor = .darkGray
		checkboxButton.translatesAutoresizingMaskIntoConstraints = false
		
		checkboxButton.layer.borderWidth = 1
		checkboxButton.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
		
		checkboxButton.addTarget(self, action: #selector(onCheckboxPress), for: .touchUpInside)
		
		return checkboxButton
	}
	
	private let billName: UILabel = {
		let billNameLabel = UILabel()
		billNameLabel.text = "Bill Name"
		billNameLabel.textAlignment = .left
		
		return billNameLabel
	}()
	
	private let billType: UILabel = {
		let billTypeLabel = UILabel()
		billTypeLabel.text = "Shopping"
		billTypeLabel.textAlignment = .left
		
		return billTypeLabel
	}()
	
	private let billAmount: UILabel = {
		let billAmountLabel = UILabel()
		billAmountLabel.text = "$1.00"
		billAmountLabel.textAlignment = .right
		
		return billAmountLabel
	}()
	
	private let billDueDate: UILabel = {
		let billDueLabel = UILabel()
		billDueLabel.text = "Due in x days"
		billDueLabel.textAlignment = .right
		
		return billDueLabel
	}()
	
	private let billRecurrence: UILabel = {
		let billRecurrenceLabel = UILabel()
		billRecurrenceLabel.text = "Every month"
		billRecurrenceLabel.textAlignment = .right
		
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
	
	private let mainStackView: UIStackView = {
		let mainStack = UIStackView()
		mainStack.translatesAutoresizingMaskIntoConstraints = false
		mainStack.backgroundColor = .systemBlue
		mainStack.axis = .horizontal
		//		mainStack.alignment = .fill
		mainStack.distribution = .fillEqually
		mainStack.spacing = 8
		return mainStack
	}()
	
	private let hStackView1: UIStackView = {
		let hStack1 = UIStackView()
		hStack1.translatesAutoresizingMaskIntoConstraints = false
		hStack1.backgroundColor = .systemPink
		hStack1.axis = .horizontal
		hStack1.alignment = .fill
		hStack1.distribution = .fillEqually
		hStack1.spacing = 8
		return hStack1
	}()
	
	private let hStackView2: UIStackView = {
		let hStack2 = UIStackView()
		hStack2.translatesAutoresizingMaskIntoConstraints = false
		hStack2.backgroundColor = .systemYellow
		hStack2.axis = .horizontal
		hStack2.alignment = .center
		hStack2.distribution = .fill
		hStack2.spacing = 8
		return hStack2
	}()
	
	private let hStackView3: UIStackView = {
		let hStack3 = UIStackView()
		hStack3.translatesAutoresizingMaskIntoConstraints = false
		hStack3.backgroundColor = .systemIndigo
		hStack3.axis = .horizontal
		hStack3.alignment = .center
		hStack3.distribution = .fill
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
	}
	
	private func commonInit() -> Void {
		
		backgroundColor = .systemMint
		
		mainStackView.addArrangedSubview(checkbox)
		mainStackView.addArrangedSubview(vStackView)
		
		hStackView1.addArrangedSubview(billName)
		hStackView1.addArrangedSubview(billAmount)
		
		hStackView2.addArrangedSubview(billType)
		hStackView2.addArrangedSubview(billDueDate)
		
		hStackView3.addArrangedSubview(billRecurrence)
		
		vStackView.addArrangedSubview(hStackView1)
		vStackView.addArrangedSubview(hStackView2)
		vStackView.addArrangedSubview(hStackView3)
		
		contentView.addSubview(mainStackView)
		
		NSLayoutConstraint.activate([
			mainStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
			mainStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			mainStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			mainStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0.0)])
	}
	
	@objc func onCheckboxPress() {
		print("box pressed")
	}
}
