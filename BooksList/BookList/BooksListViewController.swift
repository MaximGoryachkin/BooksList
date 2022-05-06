//
//  MainViewController.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import UIKit

protocol BooksListViewInputProtocol: AnyObject {
    func reloadMainView(for section: BooksListSectionViewModel)
}

protocol BooksListViewOutputProtocol {
    init(view: BooksListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

final class BooksListViewController: UITableViewController {
    var presenter: BooksListViewOutputProtocol!
    private var configurator: BooksListCofiguratorProtocol = BooksListCofigurator()
    private var section: SectionRowRepresentable = BooksListSectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        configurator.configurate(with: self)
        presenter.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = section.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksListCellTableViewCell.identifier,
                                                 for: indexPath) as! BooksListCellTableViewCell
        cell.viewModel = cellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    private func setUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BooksListCellTableViewCell.self, forCellReuseIdentifier: BooksListCellTableViewCell.identifier)
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        //title = "Books"
        title = "Books"
        navigationItem.searchController = UISearchController()
        navigationController?.navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension BooksListViewController: BooksListViewInputProtocol {
    func reloadMainView(for section: BooksListSectionViewModel) {
        self.section = section
    }
}

