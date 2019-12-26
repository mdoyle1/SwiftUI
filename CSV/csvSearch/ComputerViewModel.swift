//
//  ComputerViewModel.swift
//  csvSearch
//
//  Created by developer on 12/16/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftCSV
//
//var computerData: [ComputerModel] = []
//class ComputerListModel: ObservableObject {
//    // Main list view model
//    // ObservableObject so that updates are detected
//
//    @Published var ids: [UUID] = []
//    @Published var computers: [UUID : ComputerViewModel] = [:]
//
//    func fetchData() {
//        // avoid too many calls to the API
//        if ids.count > 0 { return }
//
//               if let url = globalPathToCsv {
//                           do {
//                               print(url)
//                               let csv: CSV = try CSV(url: globalPathToCsv)
//                              // let csv = csvFile
//                               headers = csv.header
//                               csvArray=csv.namedRows
//                               print(headers)
//                               print(csvArray[0][headers[0]] as Any)
//                                   } catch {print("contents could not be loaded")}}
//                                      else {print("the URL was bad!")}
//
//        for item in csvArray {
//                  arrayOfData.append(ComputerViewModel(
//                      barcode: item["Barcode"],
//                      model: item["Model"],
//                      description: item["ASDescription"],
//                      serial: item["Asset Serial No"],
//                      building: item["Building"],
//                      floor: item["Floor"],
//                      room: item["Room"]))
//              }
//
//            do {
//                DispatchQueue.main.async {
//                    let computerViewModels = csvArray.map { ComputerViewModel(with: $0) }
//                    self.ids = computerViewModels.map { $0.id }
//                    self.computers = Dictionary(
//                        uniqueKeysWithValues: computerViewModels.map { ($0.id, $0) }
//                    )
//                }
//            } catch {
//                print(error)
//            }
//
//    }
//
//    func refreshData() {
//        ids = []
//        computers = [:]
//        fetchData()
//    }
//
//}
//
//class ComputerViewModel: Identifiable, ObservableObject {
//
//    // Main model for use as ObservableObject
//    // Derived from JSON via basic model
//
//    // Even though this is not observed directly,
//    // it must be an ObservableObject for the data flow to work
//
//    var id = UUID()
//    @Published var barcode: String = ""
//    @Published var model: String = ""
//    @Published var description: String = ""
//    @Published var serial: String = ""
//    @Published var building: String = ""
//    @Published var floor: String = ""
//    @Published var room: String = ""
//
//
//    init(with computer: ComputerModel) {
//        self.id = computer.id
//        self.barcode = computer.barcode
//        self.model = computer.model
//        self.description = computer.description
//        self.serial = computer.serial
//        self.building = computer.building
//        self.floor = computer.floor
//        self.room = computer.room
//
//    }
//
//    init() { }
//
//}
//
//struct ComputerModel: Codable {
//    // Basic model for decoding from JSON
//
//    let id: UUID
//    let barcode: String
//    let model: String
//    let description: String
//    let serial: String
//    let building: String
//    let floor: String
//    let room: String
//
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(UUID.self, forKey: .id)
//        barcode = try values.decode(String.self, forKey: .barcode)
//        model = try values.decode(String.self, forKey: .model)
//        description = try values.decode(String.self, forKey: .description)
//        serial = try values.decode(String.self, forKey: .serial)
//        building = try values.decode(String.self, forKey: .building)
//        floor = try values.decode(String.self, forKey: .floor)
//        room = try values.decode(String.self, forKey: .room)
//
//    }
//}
//
//// Extension to force un-wrap a Dictionary value which is normally an optional.
//// This is so it can be used to create a Binding.
//extension Dictionary where Key == UUID, Value == ComputerViewModel {
//    subscript(unchecked key: Key) -> Value {
//        get {
//            guard let result = self[key] else {
//                fatalError("This computer does not exist.")
//            }
//            return result
//        }
//        set {
//            self[key] = newValue
//        }
//    }
//}
