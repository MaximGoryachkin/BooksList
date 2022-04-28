//
//  BookDetailsConfigurator.swift
//  BooksList
//
//  Created by Максим Горячкин on 28.04.2022.
//

import Foundation

protocol BookDetailsCofiguratorProtocol {
    func configurate(with viewController: BookDetailsViewController, sender: Book)
}

final class BookDetailsCofigurator: BookDetailsCofiguratorProtocol {
    func configurate(with viewController: BookDetailsViewController, sender: Book) {
        let presenter = BookDetailsPresenter(view: viewController)
        let interactor = BookDetailsInteractor(presenter: presenter, book: sender)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
