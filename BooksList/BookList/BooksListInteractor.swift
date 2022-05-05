//
//  MainInteractor.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import Foundation

protocol BooksListInteractorInputProtocol {
    init(presenter: BooksListInteractorOutputProtocol)
    func fetchBooks()
    func getBook(at indexPath: IndexPath)
}

protocol BooksListInteractorOutputProtocol: AnyObject {
    func booksDidRecieve(with books: [Book])
    func bookDidReceive(with book: Book)
}

final class BooksListInteractor: BooksListInteractorInputProtocol {
    unowned let presenter: BooksListInteractorOutputProtocol
    private let books = Book.getData()
    
    required init(presenter: BooksListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchBooks() {
        let books = Book.getData()
        presenter.booksDidRecieve(with: books)
    }
    
    func getBook(at indexPath: IndexPath) {
        presenter.bookDidReceive(with: books[indexPath.row])
    }
}
