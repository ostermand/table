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
    
    private func configure(cell: inout UITableViewCell, for indexPath:
    IndexPath) {
    if #available(iOS 14, *) {
    var configuration = cell.defaultContentConfiguration()
    configuration.text = "Строка \(indexPath.row)"
    cell.contentConfiguration = configuration
    } else {
    cell.textLabel?.text = "Строка \(indexPath.row)"
    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
    var cell: UITableViewCell
    if let reuseCell = tableView.dequeueReusableCell(withIdentifier:
    "MyCell") {
    print("Используем старую ячейку для строки с индексом \(indexPath.row)")
    cell = reuseCell
    } else {
    print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
    cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
    }
    configure(cell: &cell, for: indexPath)
    return cell
    }
        
}

