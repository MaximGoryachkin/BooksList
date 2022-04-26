//
//  MainIPresenter.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import Foundation

final class MainPresenter: MainViewOutputProtocol, MainInteractorOutputProtocol {
    
    unowned let view: MainViewInputProtocol
    var interactor: MainInteractorInputProtocol!
    
    init(view: MainViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchBooks()
    }
    
    func booksDidRecieve(with books: [Book]) {
        let section = MainSectionViewModel()
        
        books.forEach { book in
            let viewModel = MainCellViewModel(book: book)
            section.rows.append(viewModel)
        }
        view.reloadMainView(for: section)
    }
    
}
