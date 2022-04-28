//
//  BookDetailsInteractor.swift
//  BooksList
//
//  Created by Максим Горячкин on 28.04.2022.
//

import Foundation

protocol BookDetailsInteractorInputProtocol {
    init(presenter: BookDetailsInteractorOutputProtocol, book: Book)
    func provideBookDetails()
}

protocol BookDetailsInteractorOutputProtocol: AnyObject {
    func receiveBookDetails(with book: Book)
}

final class BookDetailsInteractor: BookDetailsInteractorInputProtocol {
    unowned let presenter: BookDetailsInteractorOutputProtocol
    private let book: Book
    
    required init(presenter: BookDetailsInteractorOutputProtocol, book: Book) {
        self.presenter = presenter
        self.book = book
    }
    
    func provideBookDetails() {
        presenter.receiveBookDetails(with: book)
    }
}
