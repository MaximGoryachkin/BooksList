//
//  MainCellViewModel.swift
//  BooksList
//
//  Created by Максим Горячкин on 26.04.2022.
//

import Foundation

protocol BooksListCellViewModelProtocol {
    var name: String { get set }
    var author: String { get set }
    var description: String? { get set }
    var imageData: Data? { get set }
    init(book: Book)
}

protocol SectionRowRepresentable {
    var rows: [BooksListCellViewModelProtocol] { get set }
}

class BooksListCellViewModel: BooksListCellViewModelProtocol {
    var name: String
    var author: String
    var description: String?
    var imageData: Data?
    
    required init(book: Book) {
        self.name = book.name
        self.author = book.author
        self.description = book.description
        self.imageData = book.imageData
    }
}

class BooksListSectionViewModel: SectionRowRepresentable {
    var rows: [BooksListCellViewModelProtocol] = []
}
