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
    
    private lazy var bookCover: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowRadius = 200
        view.layer.shadowOffset = CGSize(width: 50, height: 50)
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 25)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(bookCover)
        setCoverContraints()
        view.addSubview(nameLabel)
        setNameLabelConsteraints()
        presenter.showBookInfo()
    }
    
    private func setCoverContraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(bookCover.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30))
        constraints.append(bookCover.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(bookCover.widthAnchor.constraint(lessThanOrEqualToConstant: 300))
        constraints.append(bookCover.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
        
        
        // Shadow settings
        bookCover.layer.cornerRadius = 25
        bookCover.layer.shadowColor = UIColor.darkGray.cgColor
        bookCover.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        bookCover.layer.shadowRadius = 25.0
        bookCover.layer.shadowOpacity = 0.9
    }
    
    private func setNameLabelConsteraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(nameLabel.topAnchor.constraint(equalTo: bookCover.bottomAnchor, constant: 10))
        constraints.append(nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension BookDetailsViewController: BookDetailsViewInputProtocol {
    func displayBookInfo(from book: Book) {
        navigationItem.title = book.name
        nameLabel.text = book.author
        bookCover.image = book.imageData
    }
}
