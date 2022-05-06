//
//  MainCellTableViewCell.swift
//  BooksList
//
//  Created by Максим Горячкин on 26.04.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: BooksListCellViewModelProtocol? { get set }
}

class BooksListCellTableViewCell: UITableViewCell, CellModelRepresentable {
    static let identifier = "BooksListCellTableViewCell"
    
    var viewModel: BooksListCellViewModelProtocol? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let viewModel = viewModel as? BooksListCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        content.secondaryText = viewModel.author
        content.image = viewModel.imageData ?? UIImage(systemName: "character.book.closed")
        contentConfiguration = content
        accessoryType = .disclosureIndicator
    }
}
