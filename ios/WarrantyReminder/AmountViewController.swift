//
//  AmountViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-08.
//

import UIKit

private enum CalcButton: String {
	case one = "1"
	case two = "2"
	case three = "3"
	case four = "4"
	case five = "5"
	case six = "6"
	case seven = "7"
	case eight = "8"
	case nine = "9"
	case zero = "0"
	case add = "+"
	case subtract = "-"
	case divide = "÷"
	case mutliply = "x"
	case equal = "="
	case clear = "AC"
	case decimal = "."
	case percent = "%"
	case negative = "-/+"
	
	var buttonColor: UIColor {
		switch self {
			case .add, .subtract, .mutliply, .divide, .equal:
				return .orange
			case .clear, .negative, .percent:
				return .lightGray
			default:
				return UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
		}
	}
}

class AmountViewController: UIViewController {
	private let amountContainerView: UIStackView = {
		let amountContainerView = UIStackView()
		amountContainerView.translatesAutoresizingMaskIntoConstraints = false
		amountContainerView.axis = .vertical
		amountContainerView.distribution = .fill
		
		return amountContainerView
	}()
	private let displayView: UIView = {
		let displayView = UIView()
		displayView.translatesAutoresizingMaskIntoConstraints = false
		displayView.backgroundColor = .systemGray4
		
		let enterBillLabel = UILabel()
		enterBillLabel.text = "Enter bill amount"
		enterBillLabel.translatesAutoresizingMaskIntoConstraints = false
		enterBillLabel.font = UIFont.systemFont(ofSize: 14.0)
		
		let numberDisplayLabel = UILabel()
		numberDisplayLabel.text = "0"
		numberDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
		numberDisplayLabel.textAlignment = .right
		numberDisplayLabel.font = UIFont.boldSystemFont(ofSize: 50.0)
		numberDisplayLabel.numberOfLines = 1
		
		displayView.addSubview(enterBillLabel)
		displayView.addSubview(numberDisplayLabel)
		
		NSLayoutConstraint.activate([
			enterBillLabel.topAnchor.constraint(equalTo: displayView.layoutMarginsGuide.topAnchor, constant: 0.0),
			enterBillLabel.leadingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.leadingAnchor, constant: 8.0),
			enterBillLabel.trailingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.trailingAnchor, constant: 8.0),
			enterBillLabel.heightAnchor.constraint(equalToConstant: 28.0)])
		
		NSLayoutConstraint.activate([
			numberDisplayLabel.bottomAnchor.constraint(equalTo: displayView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			numberDisplayLabel.leadingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			numberDisplayLabel.trailingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.trailingAnchor, constant: -8.0)])
		
		return displayView
	}()
	private let unspecifiedAmountButton: UIButton = {
		let unspecifiedAmountButton = UIButton()
		unspecifiedAmountButton.translatesAutoresizingMaskIntoConstraints = false
		unspecifiedAmountButton.setTitle("Unspecified Amount", for: .normal)
		unspecifiedAmountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
		unspecifiedAmountButton.backgroundColor = .darkGray
		
		return unspecifiedAmountButton
	}()
	private let numberStackView: UIStackView = {
		let numberStackView = UIStackView()
		numberStackView.translatesAutoresizingMaskIntoConstraints = false
		numberStackView.backgroundColor = .orange
		
		let calcButtons: [[CalcButton]] = [
			[.clear, .negative, .percent, .divide],
			[.seven, .eight, .nine, .mutliply],
			[.four, .five, .six, .subtract],
			[.one, .two, .three, .add],
			[.zero, .decimal, .equal]
		]
		
		return numberStackView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemPink
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didPressCancel))
		self.navigationItem.title = "Amount"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didPressDone))
		unspecifiedAmountButton.addTarget(self, action: #selector(didPressUnspecified), for: .touchUpInside)
		
		amountContainerView.addArrangedSubview(displayView)
		amountContainerView.addArrangedSubview(unspecifiedAmountButton)
		amountContainerView.addArrangedSubview(numberStackView)
		
		self.view.addSubview(amountContainerView)
		
		layoutConstraints()
	}
	
	private func layoutConstraints() {
		NSLayoutConstraint.activate([
			amountContainerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0.0),
			amountContainerView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			amountContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			amountContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0)])
		
		NSLayoutConstraint.activate([
			displayView.topAnchor.constraint(equalTo: amountContainerView.topAnchor, constant: 0.0),
			displayView.leadingAnchor.constraint(equalTo: amountContainerView.leadingAnchor, constant: 0.0),
			displayView.trailingAnchor.constraint(equalTo: amountContainerView.trailingAnchor, constant: 0.0),
			displayView.heightAnchor.constraint(equalToConstant: 150.0)])
		
		NSLayoutConstraint.activate([
			unspecifiedAmountButton.topAnchor.constraint(equalTo: displayView.bottomAnchor, constant: 0.0),
			unspecifiedAmountButton.leadingAnchor.constraint(equalTo: amountContainerView.leadingAnchor, constant: 0.0),
			unspecifiedAmountButton.trailingAnchor.constraint(equalTo: amountContainerView.trailingAnchor, constant: 0.0), unspecifiedAmountButton.heightAnchor.constraint(equalToConstant: 100.0)])
		
		NSLayoutConstraint.activate([
			numberStackView.topAnchor.constraint(equalTo: unspecifiedAmountButton.bottomAnchor, constant: 0.0),
			numberStackView.bottomAnchor.constraint(equalTo: amountContainerView.bottomAnchor, constant: 0.0),
			numberStackView.leadingAnchor.constraint(equalTo: amountContainerView.leadingAnchor, constant: 0.0),
			numberStackView.trailingAnchor.constraint(equalTo: amountContainerView.trailingAnchor, constant: 0.0)])
	}
	
	@objc func didPressCancel() {
		self.dismiss(animated: true)
	}
	
	@objc func didPressDone() {
		self.dismiss(animated: true)
	}
	
	@objc func didPressUnspecified() {
		self.dismiss(animated: true)
	}
}
