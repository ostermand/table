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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //создаем экземпляр ячейки, которую будем возвращать
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "contactCellIdentifier")
        // конфигурируем ячейку
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Строка \(indexPath.row)"
        
        cell.contentConfiguration = configuration
//        // возвращаем сконфигурированный экземпляр ячейки
        return cell
    }
        
}

