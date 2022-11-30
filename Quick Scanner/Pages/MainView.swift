//
//  MainView.swift
//  Quick Scanner
//
//  Created by Meryem Şahin on 21.09.2022.
//

import SwiftUI

struct MainView: View {
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        VStack {
            ScannerMainView()
        }.fullScreenCover(isPresented: .constant(showOnboarding), content: {
            OnboardingContentView() {
                showOnboarding = false
            }
        })
    }
}
