//
//  MainConfigurator.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

protocol MainCofiguratorProtocol {
    func configurate(with viewController: MainViewController)
}

final class MainCofigurator: MainCofiguratorProtocol {
    func configurate(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
//        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
//        presenter.router = router
        
        
    }
}
