//
//  MainInteractor.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import Foundation

protocol MainInteractorInputProtocol {
    init(presenter: MainInteractorOutputProtocol)
    func fetchBooks()
}

protocol MainInteractorOutputProtocol: AnyObject {
    func booksDidRecieve(with books: [Book])
}

final class MainInteractor: MainInteractorInputProtocol {
    unowned let presenter: MainInteractorOutputProtocol
    
    required init(presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchBooks() {
        let books = Book.getData()
        presenter.booksDidRecieve(with: books)
    }
    
    
}
