//
//  Category.swift
//  Todoey
//
//  Created by Ting-Hsuan Wang on 5/1/23.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: Double = 0.0
    let items = List<Item>()
}
