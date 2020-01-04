//
//  ToggleView.swift
//  csvSearch
//
//  Created by developer on 12/17/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftUI
class ToggleView: ObservableObject {
  
    @Published var toggleView: Bool = false
    @Published var selectedHeaders:[String] = []
    @Published var selectedHeaderView = SelectedHeaderView()
}
