//
//  MainCellTableViewCell.swift
//  BooksList
//
//  Created by Максим Горячкин on 26.04.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: MainCellViewModelProtocol? { get set }
}

class MainCellTableViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: MainCellViewModelProtocol? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let viewModel = viewModel as? MainCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        content.secondaryText = viewModel.author
        content.image = UIImage(systemName: "character.book.closed")
        contentConfiguration = content
    }
}
