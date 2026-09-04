//
//  CarListTableViewCell.swift
//  view.Controller.practis#17
//
//  Created by Виктор on 04.09.2026.
//

import UIKit
import SnapKit

class CarListTableViewCell: UITableViewCell {
    
    
    let nameLabel = UILabel()
    let yearLabel = UILabel()
    let countryLabel = UILabel()
    let nameImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(nameLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(nameImage)
        
        nameImage.contentMode = .scaleAspectFill
        nameImage.clipsToBounds = true
        nameImage.layer.cornerRadius = 16
        
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        yearLabel.font = .systemFont(ofSize: 16)
        yearLabel.textColor = .secondaryLabel
        
        countryLabel.font = .systemFont(ofSize: 16)
        countryLabel.textColor = .secondaryLabel
    }
    
    func setupConstraints() {
        nameImage.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(15)
            $0.top.bottom.equalToSuperview().inset(12)
            $0.width.height.equalTo(90)
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalTo(nameImage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        yearLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(nameImage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        countryLabel.snp.makeConstraints {
            $0.top.equalTo(yearLabel.snp.bottom).offset(8)
            $0.leading.equalTo(nameImage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.lessThanOrEqualToSuperview().inset(18)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with car: Car) {
        nameLabel.text = car.name
        yearLabel.text = String(car.year)
        countryLabel.text = car.country
        nameImage.image = UIImage(resource: car.nameImage)
    }
    
}
