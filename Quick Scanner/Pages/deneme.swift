//
//  deneme.swift
//  Quick Scanner
//
//  Created by Meryem Şahin on 21.11.2022.
//

import SwiftUI
import VisionKit

struct ScannerVie: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
            let cameraViewController = VNDocumentCameraViewController()
            cameraViewController.delegate = context.coordinator
            return cameraViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(with: self)
    }
    
}

class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
    let scannerView: ScannerVie
    
    init(with scannerView: ScannerVie) {
        self.scannerView = scannerView
    }
}

