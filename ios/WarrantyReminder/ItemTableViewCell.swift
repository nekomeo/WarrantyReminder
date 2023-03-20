//
//  ItemTableViewCell.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-03-19.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
  static let identifier = "ItemTableViewCell"
  
  private let detailButton: UIButton = {
    let detailButton = UIButton()
    detailButton.backgroundColor = .red
    
    return detailButton
  }()
  
  private let someLabel: UILabel = {
    let label = UILabel()
    label.text = "Item"
    
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(detailButton)
    contentView.addSubview(someLabel)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure(text: String) {
    someLabel.text = text
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    someLabel.text = nil
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let someSize = contentView.frame.size.height - 5
    
    someLabel.frame = CGRect(x: someSize - 15, y: 5, width: 100, height: someSize)
    detailButton.frame = CGRect(x: contentView.frame.size.width - someSize - 10, y: 5, width: someSize, height: someSize)
  }
}
