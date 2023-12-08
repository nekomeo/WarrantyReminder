//
//  CalendarViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {
	private let segmentItems = ["All", "Paid", "Unpaid"]
	
	private let calendarContainerView: UIView = {
		let calendarContainerView = UIView()
		calendarContainerView.translatesAutoresizingMaskIntoConstraints = false
		
		return calendarContainerView
	}()
	private let calendar: FSCalendar = {
		let calendar = FSCalendar()
		calendar.translatesAutoresizingMaskIntoConstraints = false
		calendar.backgroundColor = .systemBackground
		calendar.appearance.titleDefaultColor = .darkGray
		calendar.appearance.todayColor = .systemTeal
		calendar.appearance.selectionColor = .systemIndigo
		
		return calendar
	}()
	private let calendarTableView: UITableView = {
		let calendarTableView = UITableView()
		calendarTableView.translatesAutoresizingMaskIntoConstraints = false
		
		return calendarTableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .systemPurple
		self.title = "Calendar"
		
		calendarContainerView.addSubview(calendar)
		calendar.delegate = self
		
		calendarContainerView.addSubview(calendarTableView)
		calendarTableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.identifier)
		calendarTableView.delegate = self
		calendarTableView.dataSource = self
		
		view.addSubview(calendarContainerView)
		
		layoutContraints()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let filterSegment = UISegmentedControl(items: segmentItems)
		filterSegment.selectedSegmentIndex = 0
		filterSegment.layer.borderWidth = 1
		filterSegment.layer.borderColor = UIColor.systemBlue.cgColor
		filterSegment.selectedSegmentTintColor = UIColor.systemBlue
		filterSegment.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .normal)
		filterSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
		
		self.navigationItem.titleView = filterSegment
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAdd))
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	private func layoutContraints() {
		NSLayoutConstraint.activate([
			calendarContainerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0.0),
			calendarContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
			calendarContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
			calendarContainerView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 0.0)])
		
		NSLayoutConstraint.activate([
			calendar.topAnchor.constraint(equalTo: calendarContainerView.topAnchor, constant: 0.0),
			calendar.leadingAnchor.constraint(equalTo: calendarContainerView.leadingAnchor, constant: 0.0),
			calendar.trailingAnchor.constraint(equalTo: calendarContainerView.trailingAnchor, constant: 0.0),
			calendar.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)])
		
		NSLayoutConstraint.activate([
			calendarTableView.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 4.0),
			calendarTableView.leadingAnchor.constraint(equalTo: calendarContainerView.leadingAnchor, constant: 0.0),
			calendarTableView.trailingAnchor.constraint(equalTo: calendarContainerView.trailingAnchor, constant: 0.0),
			calendarTableView.heightAnchor.constraint(equalToConstant: 200.0)])
	}
	
	@objc func didPressAdd() {
		let addBillVC = AddBillViewController()
		let navController = UINavigationController(rootViewController: addBillVC)
		
		navController.modalPresentationStyle = .fullScreen
		present(navController, animated: true)
	}
	
	func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
		let formatter = DateFormatter()
		
		formatter.dateFormat = "EEEE MM-dd-YYYY"
		let dateString = formatter.string(from: date)
		
		print("\(dateString)")
	}
}

extension CalendarViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as? CalendarTableViewCell else {
			return UITableViewCell()
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let editVC = EditBillViewController()
		let navController = UINavigationController(rootViewController: editVC)
		navController.modalPresentationStyle = .fullScreen
		present(navController, animated: true)
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
