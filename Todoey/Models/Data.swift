//
//  Data.swift
//  Todoey
//
//  Created by Ting-Hsuan Wang on 5/1/23.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
