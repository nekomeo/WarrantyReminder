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
	
	private let amountLabelView: UIView = {
		let someView = UIView()
		someView.translatesAutoresizingMaskIntoConstraints = false
		
		return someView
	}()
	private let unspecifiedAmountLabel: UILabel = {
		let unspecifiedAmountLabel = UILabel()
		unspecifiedAmountLabel.translatesAutoresizingMaskIntoConstraints = false
		unspecifiedAmountLabel.text = "Unspecified Amount*"
		unspecifiedAmountLabel.font = UIFont.systemFont(ofSize: billFontSize)
		
		return unspecifiedAmountLabel
	}()
	private let unspecifiedNote: UILabel = {
		let unspecifiedNote = UILabel()
		unspecifiedNote.translatesAutoresizingMaskIntoConstraints = false
		unspecifiedNote.text = "*Unspecified Amount can be used for the bills having non fixed amount."
		unspecifiedNote.numberOfLines = 2
		unspecifiedNote.textAlignment = .center
		unspecifiedNote.font = UIFont.systemFont(ofSize: 12.0)
		unspecifiedNote.textColor = .lightGray
		
		return unspecifiedNote
	}()
	private let autoPaySwitch: UISwitch = {
		let autoPaySwitch = UISwitch()
		autoPaySwitch.translatesAutoresizingMaskIntoConstraints = false
		autoPaySwitch.isOn = false
		autoPaySwitch.addTarget(identifier.self, action: #selector(switchValueChanged), for: .valueChanged)
		
		return autoPaySwitch
	}()
	private let dateStackView: UIStackView = {
		let dateStackView = UIStackView()
		dateStackView.translatesAutoresizingMaskIntoConstraints = false
		dateStackView.axis = .vertical
		dateStackView.distribution = .fillEqually
		
		let dueLabel = UILabel()
		dueLabel.text = "7 Dec 2023"
		dueLabel.font = UIFont.systemFont(ofSize: billFontSize)
		
		let repeatLabel = UILabel()
		repeatLabel.text = "Repeat Never"
		repeatLabel.font = UIFont.systemFont(ofSize: billFontSize)
		
		let endLabel = UILabel()
		endLabel.text = "Ends 7 Dec 2023"
		endLabel.font = UIFont.systemFont(ofSize: billFontSize)
		
		dateStackView.addArrangedSubview(dueLabel)
		dateStackView.addArrangedSubview(repeatLabel)
		dateStackView.addArrangedSubview(endLabel)
		
		return dateStackView
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with data: String) {
		textLabel?.text = data
		textLabel?.font = UIFont.boldSystemFont(ofSize: billFontSize)
		
		let centerXConstant = contentView.frame.width / 3
		
		// Remove the switchControl if it's already added
		autoPaySwitch.removeFromSuperview()
		
		if data == "Amount" {
			textLabel!.translatesAutoresizingMaskIntoConstraints = false
			
			contentView.addSubview(amountLabelView)
			amountLabelView.addSubview(textLabel!)
			amountLabelView.addSubview(unspecifiedAmountLabel)
			contentView.addSubview(unspecifiedNote)
			
			NSLayoutConstraint.activate([
				amountLabelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
				amountLabelView.heightAnchor.constraint(equalToConstant: contentView.frame.height / 2),
				amountLabelView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
				amountLabelView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
				textLabel!.topAnchor.constraint(equalTo: amountLabelView.topAnchor, constant: 0.0),
				textLabel!.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
				unspecifiedAmountLabel.topAnchor.constraint(equalTo: amountLabelView.topAnchor, constant: 0.0),
				unspecifiedAmountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: centerXConstant),
				unspecifiedNote.topAnchor.constraint(equalTo: textLabel!.bottomAnchor, constant: -8.0),
				unspecifiedNote.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0),
				unspecifiedNote.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0),
				unspecifiedNote.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8.0)])
		}
		
		if data == "Auto Pay Bill" {
			textLabel!.translatesAutoresizingMaskIntoConstraints = false
			
			contentView.addSubview(textLabel!)
			contentView.addSubview(autoPaySwitch)
			
			NSLayoutConstraint.activate([
				textLabel!.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				textLabel!.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
				autoPaySwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				autoPaySwitch.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: centerXConstant)])
		}
		
		if data == "Date" {
			textLabel!.translatesAutoresizingMaskIntoConstraints = false
			
			contentView.addSubview(textLabel!)
			contentView.addSubview(dateStackView)
			
			dateStackView.addSubview(textLabel!)
			
			NSLayoutConstraint.activate([
				textLabel!.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				textLabel!.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
				dateStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0.0),
				dateStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
				dateStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: centerXConstant),
				dateStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0)])
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
