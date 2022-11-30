//
//  ScannerView.swift
//  Quick Scanner
//
//  Created by Meryem Şahin on 26.10.2022.
//

import SwiftUI

struct ScannerMainView: View {
    @StateObject var recognizedContent = ScanTextModel()
    @State private var isRecognizing = false
    @State private var showScanner = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottom) {
                    List(recognizedContent.items, id: \.id) { textItem in
                        NavigationLink(destination: DetailView(text: textItem.text)) {
                            Text(String(textItem.text.prefix(50)).appending("..."))
                        }
                    }
                    if isRecognizing {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color(UIColor.systemIndigo)))
                            .padding(.bottom, 20)
                    }
                }
                Button(action: {
                    guard !isRecognizing else { return }
                    showScanner = true
                }) {
                    HStack {
                        Image(systemName: "text.viewfinder")
                        Text("Scan")
                    }
                }.foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .frame(width: 120, height: 42)
                    .background(Color(UIColor.orange))
                    .cornerRadius(18)
            }.navigationTitle("Quick Scanner")
                .navigationBarTitleDisplayMode(.inline)
            
        }.sheet(isPresented: $showScanner, content: {
            ScannerView { result in
                switch result {
                case .success(let scannedImages):
                    showScanner = true
                    isRecognizing = true
                    
                    TextRecognizeView(scannedImages: scannedImages,
                                      recognizedContent: recognizedContent) {
                        // Text recognition is finished, hide the progress indicator.
                        isRecognizing = false
                    }.recognizeText()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
                showScanner = false
            } didCancelScanning: {
                // Dismiss the scanner controller and the sheet.
                showScanner = false
            }
        })
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerMainView()
    }
}
