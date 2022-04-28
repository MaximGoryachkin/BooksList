//
//  BookDetailsViewController.swift
//  BooksList
//
//  Created by Максим Горячкин on 28.04.2022.
//

import UIKit

protocol BookDetailsViewInputProtocol: AnyObject {
    func displayBookInfo(from book: Book)
}

protocol BookDetailsViewOutputProtocol {
    func showBookInfo()
    init(view: BookDetailsViewInputProtocol)
}

final class BookDetailsViewController: UIViewController {
    var presenter: BookDetailsViewOutputProtocol!
    
    private lazy var label: UILabel = {
        let view = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(label)
        presenter.showBookInfo()
    }
}

extension BookDetailsViewController: BookDetailsViewInputProtocol {
    func displayBookInfo(from book: Book) {
        label.text = "\(book.name) \(book.author)"
    }
}
