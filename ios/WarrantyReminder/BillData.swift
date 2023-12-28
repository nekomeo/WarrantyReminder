//
//  BillData.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-12-28.
//

import Foundation

struct SectionData {
	var rows: [String]
}

class DataManager {
	static let shared = DataManager()
	
	var sectionData: [SectionData] = [
		SectionData(rows: ["Bill Name", "Category"]),
		SectionData(rows: ["Amount", "Auto Pay Bill"]),
		SectionData(rows: ["Date", "Notes"])
	]
	
//	var sectionData: [SectionData] = [
//		SectionData(rows: ["1", "2"]),
//		SectionData(rows: ["AA", "BB"]),
//		SectionData(rows: ["1A", "1B"])
//	]
}
