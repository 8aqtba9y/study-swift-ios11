//
//  Category.swift
//  Todoey
//
//  Created by Qi Jsb on 2018/04/03.
//  Copyright © 2018年 Qi Jsb. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}
