//
//  ViewController.swift
//  Table
//
//  Created by Дмитрий Остерман on 01.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Строка \(indexPath.row)"
        cell.contentConfiguration = configuration
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // производим попытку загрузки переиспользуемой ячейки
    guard var cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") else {
    print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
    var newCell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        configure(cell: &newCell, for: indexPath)
        return newCell
    }
    print("Используем старую ячейку для строки с индексом \(indexPath.row)")
        configure(cell: &cell, for: indexPath)
    return cell
    }
        
}

