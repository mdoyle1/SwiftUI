//
//  DataProvider.swift
//  csvSearch
//
//  Created by developer on 12/13/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//
import Foundation
import Combine

final class DataProvider: ObservableObject {
    let didChange = PassthroughSubject<DataProvider, Never>()

    var array = [Container]() {
        didSet {
            didChange.send(self)
        }
    }
}
