//
//  MainConfigurator.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

protocol BooksListCofiguratorProtocol {
    func configurate(with viewController: BooksListViewController)
}

final class BooksListCofigurator: BooksListCofiguratorProtocol {
    func configurate(with viewController: BooksListViewController) {
        let presenter = BooksListPresenter(view: viewController)
        let interactor = BooksListInteractor(presenter: presenter)
        let router = BooksListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
