//
//  ViewController.swift
//  Table
//
//  Created by Дмитрий Остерман on 01.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var contacts = [ContactProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadContacts()
    }

    private func loadContacts() {
        contacts.append(Contact(title: "Dmitriy", phone: "+79951234576"))
        contacts.append(Contact(title: "Alex", phone: "+79106579812"))
        contacts.append(Contact(title: "Lubov", phone: "+79156878345"))
        contacts.sorted {$1.title < $0.title}
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath:
    IndexPath) {
    if #available(iOS 14, *) {
    var configuration = cell.defaultContentConfiguration()
        // имя контакта
        configuration.text = contacts[indexPath.row].title
        // номер телефона контакта
        configuration.secondaryText = contacts[indexPath.row].phone
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        print("Определяем доступные действия для строки \(indexPath.row)")
        // действие удаления
        let actionDelete = UIContextualAction(style: .destructive, title: "Delete") {_,_,_ in
            // удаляем контакт
            self.contacts.remove(at: indexPath.row)
            // заново формируем табличное представление
            tableView.reloadData()
        }
        // формируем экземпляр, описывающий доступные действия
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
    }
}
