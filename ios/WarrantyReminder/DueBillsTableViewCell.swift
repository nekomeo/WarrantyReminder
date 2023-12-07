//
//  DueBillsTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-03-19.
//

import UIKit

class DueBillsTableViewCell: UITableViewCell {
	static let identifier = "DueBillsTableViewCell"
	private var isOverdue: Bool = false
	
	// MARK: - UI Components
	private var checkbox: UIButton =  {
		let checkboxButton = UIButton()
		checkboxButton.layer.borderWidth = 1
		checkboxButton.layer.borderColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
		checkboxButton.translatesAutoresizingMaskIntoConstraints = false
		
		return checkboxButton
	}()
	
	private let billName: UILabel = {
		let billNameLabel = UILabel()
		billNameLabel.text = "Bill Name"
		billNameLabel.textAlignment = .left
		billNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		return billNameLabel
	}()
	
	private let billType: UILabel = {
		let billTypeLabel = UILabel()
		billTypeLabel.text = "Shopping"
		billTypeLabel.textAlignment = .left
		billTypeLabel.translatesAutoresizingMaskIntoConstraints = false
		
		return billTypeLabel
	}()
	
	private let billAmount: UILabel = {
		let billAmountLabel = UILabel()
		billAmountLabel.text = "$1.00"
		billAmountLabel.textAlignment = .right
		billAmountLabel.font = UIFont.boldSystemFont(ofSize: 16)
		billAmountLabel.translatesAutoresizingMaskIntoConstraints = false
		
		return billAmountLabel
	}()
	
	private let billDueDate: UILabel = {
		let billDueLabel = UILabel()
		billDueLabel.text = "Due in 2 days (Tue)"
		billDueLabel.textAlignment = .right
		billDueLabel.translatesAutoresizingMaskIntoConstraints = false
		
		return billDueLabel
	}()
	
	private let billRecurrence: UILabel = {
		let billRecurrenceLabel = UILabel()
		billRecurrenceLabel.text = "Every month"
		billRecurrenceLabel.textAlignment = .right
		billRecurrenceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		return billRecurrenceLabel
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
		
		//		hStack1.layer.borderWidth = 1
		//		hStack1.layer.borderColor = .init(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
		
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
		//		hStack3.distribution = .fill
		hStack3.spacing = 8
		
		//		hStack3.layer.borderWidth = 1
		//		hStack3.layer.borderColor = .init(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
		
		return hStack3
	}()
	
	private let vStackView: UIStackView = {
		let verticalStack = UIStackView()
		
		verticalStack.translatesAutoresizingMaskIntoConstraints = false
		verticalStack.axis = .vertical
		verticalStack.alignment = .trailing
		verticalStack.distribution = .fill
		verticalStack.spacing = 4
		//		verticalStack.layer.borderWidth = 1
		//		verticalStack.layer.borderColor = .init(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
		
		return verticalStack
	}()
	
	// MARK: -
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configure(text: String) {
		//		billName.text = text
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		checkbox.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
		checkbox.layer.borderWidth = 1
		checkbox.layer.borderColor = .init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		checkbox.addTarget(self, action: #selector(onCheckboxPress), for: .touchUpInside)
		
		billAmount.textColor = isOverdue ? .red : .init(red: 0.138, green: 0.008, blue: 0.854, alpha: 1.0)
		//		billAmount.textColor = isOverdue ? .red : .init(red: 35/255, green: 2/255, blue: 198/255, alpha: 1.0)
	}
	
	private func commonInit() -> Void {
		
		backgroundColor = .systemMint
		
		//		checkbox.frame = CGRect(x: 10, y: 6, width: 20, height: 20)
		//		let detailButtonSize = contentView.frame.size.height
		//		frame: CGRect(x: contentView.frame.size.width - detailButtonSize - 10, y: detailButtonSize / 6, width: 20, height: 20)
		
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
	
	@objc func onCheckboxPress() {
		print("box pressed")
	}
}
