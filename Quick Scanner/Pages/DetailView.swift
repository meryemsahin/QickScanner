//
//  DetailView.swift
//  Quick Scanner
//
//  Created by Meryem Şahin on 26.10.2022.
//

import SwiftUI

struct DetailView: View {
    var text: String
    
    var body: some View {
        VStack {
            ScrollView {
                Text(text)
                    .font(.body)
                    .padding()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(text: "")
    }
}
