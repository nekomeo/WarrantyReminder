//
//  CalendarViewController.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-04-23.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {
	
	var calendar = FSCalendar()
	
	let segmentItems = ["All", "Paid", "Unpaid"]
	let calendarContainerView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
	let calendarTableContainerView = UIView(frame: CGRect(x: 0, y: 500, width: UIScreen.main.bounds.width, height: 100))
	
	let calendarTableView = UITableView(frame: CGRect(x: 0, y: 600, width: 40, height: 40))
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = UIColor.systemPurple
		
		calendarTableContainerView.addSubview(calendarTableView)
		calendarTableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.identifier)
		calendarTableView.delegate = self
		calendarTableView.dataSource = self
		
//		tableView.translatesAutoresizingMaskIntoConstraints = false
//		tableView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 0).isActive = true
//		tableView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -100).isActive = true
//		tableView.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor, constant: 0).isActive = true
//		tableView.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor, constant: 0).isActive = true
		
		calendarContainerView.backgroundColor = .white
		calendarTableContainerView.backgroundColor = .systemCyan
		self.title = "Calendar"
		
		view.addSubview(calendarContainerView)
		view.addSubview(calendarTableContainerView)

		calendar.delegate = self
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

		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: Any?.self, action: #selector(didPressAdd))

		calendar.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.width)
		calendarTableView.frame = calendarTableContainerView.bounds
		
		self.navigationItem.titleView = filterSegment
		self.navigationItem.rightBarButtonItem = addButton
		view.addSubview(calendar)
	}
	
	@objc func didPressAdd() {
		print("Add button pressed")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
		let formatter = DateFormatter()

		formatter.dateFormat = "EEEE MM-dd-YYYY"
		let dateString = formatter.string(from: date)
		
		print("\(dateString)")
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension CalendarViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as? CalendarTableViewCell else {
			return UITableViewCell()
		}
		
//		cell.configure(text: "Custom \(indexPath.row+1)")
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
