//
//  CarListViewController.swift
//  view.Controller.practis#17
//
//  Created by Виктор on 04.09.2026.
//

import UIKit
import SnapKit

struct Car {
    let name:String
    let year: Int
    let country: String
    let nameImage: ImageResource
}

protocol CarsTransmitionDelegate: AnyObject {
    func carTransmition(_ car: Car)
}

class CarListViewController: UIViewController {
    let cars: [Car] = [
        Car(name: "BMW M5", year: 2024, country: "Germany", nameImage: .bmwM5),
        Car(name: "Audi RS6", year: 2024, country: "Germany", nameImage: .audiRS6),
        Car(name: "Mercedes-AMG GT", year: 2024, country: "Germany", nameImage: .mercedesAMGGT),
        Car(name: "Porsche 911", year: 2024, country: "Germany", nameImage: .porsche911),
        Car(name: "Ford Mustang GT", year: 2024, country: "USA", nameImage: .fordMustang),
        Car(name: "Toyota GR Supra", year: 2023, country: "Japan", nameImage: .toyotaSupra),
        Car(name: "Nissan GT-R", year: 2024, country: "Japan", nameImage: .nissanGTR),
        Car(name: "Chevrolet Corvette C8", year: 2024, country: "USA", nameImage: .corvetteC8),
        Car(name: "Lamborghini Huracan", year: 2023, country: "Italy", nameImage: .lamborghiniHuracan),
        Car(name: "Ferrari 488 GTB", year: 2019, country: "Italy", nameImage: .ferrari488),
        Car(name: "McLaren 720S", year: 2023, country: "United Kingdom", nameImage: .mclaren720S),
        Car(name: "Dodge Challenger SRT Hellcat", year: 2023, country: "USA", nameImage: .dodgeChallenger)
    ]
    let tableView = UITableView()
    private let cellidentifier = "CarCell"
    weak var delegate: CarsTransmitionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CarListTableViewCell.self, forCellReuseIdentifier: cellidentifier)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(15)
        }
    }
    
}

extension CarListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = cars[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath) as?  CarListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: car)
        return cell
    }
    
    
}

extension CarListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = cars[indexPath.row]
        delegate?.carTransmition(car)
        navigationController?.popViewController(animated: true)
    }
}


