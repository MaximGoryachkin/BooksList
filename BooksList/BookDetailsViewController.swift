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
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    private lazy var bookCover: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 25)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var authorLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionlLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 15)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        presenter.showBookInfo()
        setScroolViewConstraints()
        setCoverContraints()
    }
    
    private func setScroolViewConstraints() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    private func setCoverContraints() {
        contentView.addSubview(bookCover)
        bookCover.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        bookCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        bookCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        bookCover.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        contentView.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: bookCover.bottomAnchor, constant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        contentView.addSubview(authorLabel)
        authorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        authorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        authorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        contentView.addSubview(descriptionlLabel)
        descriptionlLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        descriptionlLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20).isActive = true
        descriptionlLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        descriptionlLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        // Shadow settings
        bookCover.layer.cornerRadius = 25
        bookCover.layer.shadowColor = UIColor.darkGray.cgColor
        bookCover.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        bookCover.layer.shadowRadius = 25.0
        bookCover.layer.shadowOpacity = 0.9
    }
    
}

extension BookDetailsViewController: BookDetailsViewInputProtocol {
    func displayBookInfo(from book: Book) {
        navigationItem.title = book.name
        nameLabel.text = book.name
        authorLabel.text = book.author
        descriptionlLabel.text = book.description
        bookCover.image = book.imageData
    }
}
