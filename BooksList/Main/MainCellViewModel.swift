//
//  MainCellViewModel.swift
//  BooksList
//
//  Created by Максим Горячкин on 26.04.2022.
//

import Foundation

protocol MainCellViewModelProtocol {
    var name: String { get set }
    var author: String { get set }
    var description: String? { get set }
    var imageData: Data? { get set }
    init(book: Book)
}

protocol SectionRowRepresentable {
    var rows: [MainCellViewModelProtocol] { get set }
}

class MainCellViewModel: MainCellViewModelProtocol {
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

class MainSectionViewModel: SectionRowRepresentable {
    var rows: [MainCellViewModelProtocol] = []
}
