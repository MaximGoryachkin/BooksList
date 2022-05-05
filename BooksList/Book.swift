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
            Book(name: "Сто лет одиночества",
                 author: "Габриэль Гарсиа Маркес",
                 description: "Одна из величайшихкниг XX века. Странная, поэтичная, причудливая история города Макондо, затерянного где-то в джунглях, – от сотворения до упадка. История рода Буэндиа – семьи, в которой чудеса столь повседневны, что на них даже не обращают внимания. Клан Буэндиа порождает святых и грешников, революционеров, героев и предателей, лихих авантюристов – и женщин, слишком прекрасных для обычной жизни. В нем кипят необычайные страсти – и происходят невероятные события. Однако эти невероятные события снова и снова становятся своеобразным «волшебным зеркалом», сквозь которое читателю является подлинная история Латинской Америки…",
                 imageData: UIImage(named: "Sto let odinochestva"),
                 note: nil)
        ]
    }
}
