//
//  MainRouter.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import Foundation

protocol BooksListRouterProtocol {
    init(viewController: BooksListViewController)
    func openBookDetailsViewController(with book: Book)
}

final class BooksListRouter: BooksListRouterProtocol {
    unowned let viewController: BooksListViewController
    
    required init(viewController: BooksListViewController) {
        self.viewController = viewController
    }
    
    func openBookDetailsViewController(with book: Book) {
        let bookDetailsVC = BookDetailsViewController()
        let configurator: BookDetailsCofiguratorProtocol = BookDetailsCofigurator()
        configurator.configurate(with: bookDetailsVC, sender: book)
        viewController.show(bookDetailsVC, sender: book)
    }
    
    
}
