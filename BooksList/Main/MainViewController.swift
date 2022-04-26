//
//  MainViewController.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import UIKit

protocol MainViewInputProtocol: AnyObject {
    func reloadMainView(for section: MainSectionViewModel)
}

protocol MainViewOutputProtocol {
    init(view: MainViewInputProtocol)
    func viewDidLoad()
}

final class MainViewController: UITableViewController {
    
    var presenter: MainViewOutputProtocol!
    private var configurator: MainCofiguratorProtocol = MainCofigurator()
    private var section: SectionRowRepresentable = MainSectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        configurator.configurate(with: self)
        presenter.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = section.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCellTableViewCell
        cell.viewModel = cellViewModel
        return cell
    }
    
    private func setLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainCellTableViewCell.self, forCellReuseIdentifier: "cell")
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        navigationItem.title = "Books"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}

extension MainViewController: MainViewInputProtocol {
    func reloadMainView(for section: MainSectionViewModel) {
        self.section = section
    }
}

