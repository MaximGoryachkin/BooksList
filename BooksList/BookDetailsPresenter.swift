//
//  BookDetailsPresenter.swift
//  BooksList
//
//  Created by Максим Горячкин on 28.04.2022.
//

import Foundation

final class BookDetailsPresenter: BookDetailsViewOutputProtocol, BookDetailsInteractorOutputProtocol {
    unowned let view: BookDetailsViewInputProtocol
    var interactor: BookDetailsInteractorInputProtocol!

    init(view: BookDetailsViewInputProtocol) {
        self.view = view
    }

    func showBookInfo() {
        interactor.provideBookDetails()
    }

    func receiveBookDetails(with book: Book) {
        view.displayBookInfo(from: book)
    }
}
