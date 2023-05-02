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
    let items = List<Item>()
}
