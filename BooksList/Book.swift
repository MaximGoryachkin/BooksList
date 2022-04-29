//
//  Model.swift
//  BooksList
//
//  Created by Максим Горячкин on 25.04.2022.
//

import Foundation
import UIKit

struct Book {
    let name: String
    let author: String
    let description: String?
    let imageData: UIImage?
    let note: String?
//    let beginDate: Date
//    let endDate: Date
    
    static func getData() -> [Book] {
        [
            Book(name: "Граф Монте-Кристо", author: "Александр Дюма", description: nil, imageData: UIImage(named: "Graf Monte-Christo"), note: nil),
            Book(name: "Чужак", author: "Макс Фрай", description: nil, imageData: UIImage(named: "Chuzhak"), note: nil),
            Book(name: "Сто лет одиночества", author: "Габриэль Гарсиа Маркес", description: nil, imageData: UIImage(named: "Sto let odinochestva"), note: nil)
        ]
    }
}
