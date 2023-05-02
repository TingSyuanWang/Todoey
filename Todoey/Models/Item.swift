//
//  Item.swift
//  Todoey
//
//  Created by Ting-Hsuan Wang on 5/1/23.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
