//
//  OnboardingView.swift
//  Quick Scanner
//
//  Created by Meryem Şahin on 19.09.2022.
//

import SwiftUI

typealias OnBoardingGetStartedAction = () -> ()

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let image: String
    let title: String
    let subTitle: String
    let buttonTitle: String
    let buttonVisible: Bool
    let handler: OnBoardingGetStartedAction
    
    init(image: String, title: String, subTitle: String, buttonTitle: String, buttonVisible: Bool, handler: @escaping OnBoardingGetStartedAction) {
       self.image = image
       self.title = title
       self.subTitle = subTitle
       self.buttonTitle = buttonTitle
       self.buttonVisible = buttonVisible
       self.handler = handler
   }
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(title)
                .multilineTextAlignment(.center)
                .font(.title2)
            Text(subTitle)
                .multilineTextAlignment(.center)
                .font(.subheadline)
            Button(action: {
                handler()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text(buttonTitle)
            }.frame(width: 300, height: 40)
                .background(Color.gray)
                .foregroundColor(.white)
                .font(.title2)
                .clipShape(Capsule())
                .padding(.top, 50)
                .opacity(buttonVisible ? 0 : 1)
        }
        .padding(.horizontal, 30)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(image: "documentIcon", title: "Quick Scanner uygulamasına hoş geldiniz!", subTitle: "Quick Scanner ile fotoğraflarınızı kolayca tarayıp PDF-Word-Text formatlarına getirebilirsiniz.", buttonTitle: "Başla", buttonVisible: false) { }
    }
}
