//
//  OnboardingContentView.swift
//  Quick Scanner
//
//  Created by Meryem Şahin on 24.10.2022.
//

import SwiftUI

struct OnboardingContentView: View {
    
    let handler: OnBoardingGetStartedAction
    
    init(handler: @escaping OnBoardingGetStartedAction) {
        self.handler = handler
    }
    
    var body: some View {
        TabView {
            OnboardingView(image: "documentIcon", title: "Quick Scanner uygulamasına hoş geldiniz!", subTitle: "Quick Scanner ile fotoğraflarınızı kolayca tarayıp PDF-Word-Text formatlarına getirebilirsiniz.", buttonTitle: "", buttonVisible: true, handler: handler)
            
            OnboardingView(image: "documentIcon", title: "Quick Scanner uygulamasına hoş geldiniz!", subTitle: "Quick Scanner ile fotoğraflarınızı kolayca tarayıp PDF-Word-Text formatlarına getirebilirsiniz.", buttonTitle: "", buttonVisible: true, handler: handler)
            
            OnboardingView(image: "documentIcon", title: "Quick Scanner uygulamasına hoş geldiniz!", subTitle: "Quick Scanner ile fotoğraflarınızı kolayca tarayıp PDF-Word-Text formatlarına getirebilirsiniz.", buttonTitle: "Başla", buttonVisible: false, handler: handler)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView { }
    }
}
