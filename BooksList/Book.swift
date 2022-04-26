//
//  Model.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import Foundation

struct Book {
    let name: String
    let author: String
    let description: String?
    let imageData: Data?
    
    static func getData() -> [Book] {
        [
            Book(name: "Граф Монте-Кристо", author: "Александр Дюма", description: nil, imageData: nil),
            Book(name: "Чужак", author: "Макс Фрай", description: nil, imageData: nil),
            Book(name: "Сто лет одиночества", author: "Габриэль Гарсиа Маркес", description: nil, imageData: nil)
        ]
    }
}
