//
//  ScanTextModel.swift
//  Quick Scanner
//
//  Created by Meryem Şahin on 27.09.2022.
//

import Foundation

class TextItem: Identifiable {
    var id: String = ""
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
}

final class ScanTextModel: ObservableObject {
    @Published var items = [TextItem]()
}
