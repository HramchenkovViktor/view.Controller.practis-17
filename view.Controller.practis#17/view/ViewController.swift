//
//  ViewController.swift
//  view.Controller.practis#17
//
//  Created by Виктор on 04.09.2026.
//

import UIKit
import SnapKit



class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let cardView = UIView()
    let autoImage = UIImageView()
    let titleCard = UILabel()
    let selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(cardView)
        view.addSubview(selectedButton)
        
        cardView.addSubview(autoImage)
        cardView.addSubview(titleCard)
        
        titleLabel.text = "Выбранный автомобиль"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.clipsToBounds = true
        
        cardView.backgroundColor = .systemPink.withAlphaComponent(0.12)
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 20
        
        
        autoImage.image = UIImage(resource: .auto)
        autoImage.layer.cornerRadius = 20
        autoImage.clipsToBounds = true
        autoImage.contentMode = .scaleAspectFill
        
        titleCard.text = "Автомобиль не выбран"
        titleCard.textColor = .black
        titleCard.textAlignment = .center
        titleCard.numberOfLines = 0
        titleCard.clipsToBounds = true
        
        selectedButton.setTitle("Выбрать автомобиль", for: .normal)
        selectedButton.setTitleColor(.black, for: .normal)
        selectedButton.layer.cornerRadius = 20
        selectedButton.clipsToBounds = true
        selectedButton.backgroundColor = .systemPink.withAlphaComponent(0.12)
        selectedButton.addTarget(self, action: #selector(selectedButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        cardView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        autoImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(180)
        }
        titleCard.snp.makeConstraints{
            $0.top.equalTo(autoImage.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(15)
        }
        selectedButton.snp.makeConstraints{
            $0.top.equalTo(cardView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
    }
    @objc private func selectedButtonTapped(){
        let viewController = CarListViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ViewController: CarsTransmitionDelegate {
    func carTransmition(_ car: Car) {
        titleCard.text = """
                        \(car.name),
                        \(car.year),
                        \(car.country),
            """
        autoImage.image = UIImage(resource: car.nameImage)
    }
}


