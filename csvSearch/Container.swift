//
//  Container.swift
//  csvSearch
//
//  Created by developer on 12/12/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Container: Hashable {
    //let id: UUID
    let barcode:String?
    let model:String?
    let description:String?
    let serial:String?
    let building:String?
    let floor:String?
    let room:String?
    
}


struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
