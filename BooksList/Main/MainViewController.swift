//
//  MainViewController.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import UIKit

protocol MainViewInputProtocol: AnyObject {
    func reloadMainView()
}

protocol MainViewOutputProtocol {
    init(view: MainViewInputProtocol)
    func viewDidLoad()
}

final class MainViewController: UIViewController {

    var presenter: MainViewOutputProtocol!
    private var configurator: MainCofiguratorProtocol = MainCofigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configurate(with: self)
        presenter.viewDidLoad()
    }
    
}

extension MainViewController: MainViewInputProtocol {
    func reloadMainView() {
        print("12")
    }
}
