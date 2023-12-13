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
	case mutliply = "×"
	case equal = "="
	case clearAll = "AC"
	case clear = "C"
	case decimal = "."
	case negative = "±"
	case delete = "⌫"
	
	var buttonColor: UIColor {
		switch self {
			case .add, .subtract, .mutliply, .divide, .negative:
				return .orange
			case .clearAll, .clear, .delete:
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
	private let numberDisplayLabel: UILabel = {
		let numberDisplayLabel = UILabel()
		numberDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
		numberDisplayLabel.textAlignment = .right
		numberDisplayLabel.font = UIFont.boldSystemFont(ofSize: 50.0)
		numberDisplayLabel.numberOfLines = 1
		numberDisplayLabel.lineBreakMode = .byClipping
		
		return numberDisplayLabel
	}()
	private let displayView: UIView = {
		let displayView = UIView()
		displayView.translatesAutoresizingMaskIntoConstraints = false
		displayView.backgroundColor = .systemGray4
		
		let enterBillLabel = UILabel()
		enterBillLabel.text = "Enter bill amount"
		enterBillLabel.translatesAutoresizingMaskIntoConstraints = false
		enterBillLabel.font = UIFont.systemFont(ofSize: 14.0)
		
		displayView.addSubview(enterBillLabel)
		
		NSLayoutConstraint.activate([
			enterBillLabel.topAnchor.constraint(equalTo: displayView.layoutMarginsGuide.topAnchor, constant: 0.0),
			enterBillLabel.leadingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.leadingAnchor, constant: 8.0),
			enterBillLabel.trailingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.trailingAnchor, constant: 8.0),
			enterBillLabel.heightAnchor.constraint(equalToConstant: 28.0)])
		
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
	private let calculatorView: UIView = {
		let calculatorView = UIView()
		calculatorView.translatesAutoresizingMaskIntoConstraints = false
		calculatorView.backgroundColor = .systemGray4
		
		return calculatorView
	}()
	private let calcButtons: [[CalcButton]] = [
		[.clearAll, .clear, .delete, .negative],
		[.seven, .eight, .nine, .divide],
		[.four, .five, .six, .mutliply],
		[.one, .two, .three, .subtract],
		[.zero, .decimal, .equal, .add],
	]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemPink
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didPressCancel))
		self.navigationItem.title = "Amount"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didPressDone))
		unspecifiedAmountButton.addTarget(self, action: #selector(didPressUnspecified), for: .touchUpInside)
		
		amountContainerView.addArrangedSubview(displayView)
		amountContainerView.addArrangedSubview(unspecifiedAmountButton)
		amountContainerView.addArrangedSubview(calculatorView)
		
		displayView.addSubview(numberDisplayLabel)
		
		calculatorGrid(rows: 5, columns: 4, rootView: calculatorView)
		
		self.view.addSubview(amountContainerView)
		
		numberDisplayLabel.text = "0"
		numberDisplayLabel.becomeFirstResponder()
		
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
			numberDisplayLabel.bottomAnchor.constraint(equalTo: displayView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
			numberDisplayLabel.leadingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
			numberDisplayLabel.trailingAnchor.constraint(equalTo: displayView.layoutMarginsGuide.trailingAnchor, constant: -8.0)])
		
		NSLayoutConstraint.activate([
			unspecifiedAmountButton.topAnchor.constraint(equalTo: displayView.bottomAnchor, constant: 0.0),
			unspecifiedAmountButton.leadingAnchor.constraint(equalTo: amountContainerView.leadingAnchor, constant: 0.0),
			unspecifiedAmountButton.trailingAnchor.constraint(equalTo: amountContainerView.trailingAnchor, constant: 0.0), unspecifiedAmountButton.heightAnchor.constraint(equalToConstant: 100.0)])
		
		NSLayoutConstraint.activate([
			calculatorView.topAnchor.constraint(equalTo: unspecifiedAmountButton.bottomAnchor, constant: 0.0),
			calculatorView.bottomAnchor.constraint(equalTo: amountContainerView.bottomAnchor, constant: 0.0),
			calculatorView.leadingAnchor.constraint(equalTo: amountContainerView.leadingAnchor, constant: 0.0),
			calculatorView.trailingAnchor.constraint(equalTo: amountContainerView.trailingAnchor, constant: 0.0)])
	}
	private func calculatorGrid(rows: Int, columns: Int, rootView: UIView){
		let spacing = 2.0
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = spacing
		
		for row in calcButtons {
			let rowStackView = UIStackView()
			rowStackView.axis = .horizontal
			rowStackView.distribution = .fillEqually
			rowStackView.spacing = spacing
			
			for button in row {
				let buttonView = UIButton(type: .system)
				buttonView.setTitle(button.rawValue, for: .normal)
				buttonView.backgroundColor = button.buttonColor
				buttonView.setTitleColor(.white, for: .normal)
				buttonView.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
				buttonView.addTarget(self, action: #selector(didPressCalcButton), for: .touchUpInside)
				rowStackView.addArrangedSubview(buttonView)
			}
			
			stackView.addArrangedSubview(rowStackView)
		}
		
		rootView.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 0.0),
			stackView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: 0.0),
			stackView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 0.0),
			stackView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: 0.0)])
	}
	
	private func updateDisplay(with calcButton: CalcButton) {
		if calcButton == .clear {
			numberDisplayLabel.text = "0"
		} else {
			if let currentText = numberDisplayLabel.text {
				let newText = currentText + calcButton.rawValue
				let maxAllowedLength = Int(numberDisplayLabel.font.pointSize)
				let trimmedText = String(newText.suffix(maxAllowedLength))
				
				numberDisplayLabel.text = trimmedText
			}
		}
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
	
	@objc func didPressCalcButton(_ sender: UIButton){
		if let title = sender.currentTitle,
			 let calcButton = CalcButton(rawValue: title) {
			print("Tapped button: \(calcButton)")
			updateDisplay(with: calcButton)
		}
	}
}
