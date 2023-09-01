//
//  DueBillsTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-03-19.
//

import UIKit

class DueBillsTableViewCell: UITableViewCell {
  static let identifier = "DueBillsTableViewCell"
  
  private let detailButton: UIButton = {
    let detailButton = UIButton()

    detailButton.layer.borderWidth = 1
    detailButton.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    
    return detailButton
  }()
  
  private let billName: UILabel = {
    let billLabel = UILabel()
    billLabel.text = "Item"
    
    return billLabel
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(detailButton)
    contentView.addSubview(billName)
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
    
    let detailButtonSize = contentView.frame.size.height
    
		billName.frame = CGRect(x: detailButtonSize / 2, y: 0, width: contentView.frame.size.width / 2, height: detailButtonSize)
		
		detailButton.frame = CGRect(x: contentView.frame.size.width - detailButtonSize - 10, y: detailButtonSize / 6, width: detailButtonSize / 1.5, height: detailButtonSize / 1.5)
  }
}
