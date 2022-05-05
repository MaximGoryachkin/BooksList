//
//  MainIPresenter.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import Foundation

final class BooksListPresenter: BooksListViewOutputProtocol, BooksListInteractorOutputProtocol {
    
    unowned let view: BooksListViewInputProtocol
    var interactor: BooksListInteractorInputProtocol!
    var router: BooksListRouterProtocol!
    
    init(view: BooksListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchBooks()
    }
    
    func booksDidRecieve(with books: [Book]) {
        let section = BooksListSectionViewModel()
        
        books.forEach { book in
            let viewModel = BooksListCellViewModel(book: book)
            section.rows.append(viewModel)
        }
        view.reloadMainView(for: section)
    }
    
    func bookDidReceive(with book: Book) {
        router.openBookDetailsViewController(with: book)
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getBook(at: indexPath)
    }
    
}
