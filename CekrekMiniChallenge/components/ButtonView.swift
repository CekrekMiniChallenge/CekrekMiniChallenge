//
//  ButtonView.swift
//  CekrekMiniChallenge
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 03/07/24.
//

import SwiftUI

struct ButtonView: View {
    
    var body: some View {
        VStack{
            Button("Press me") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrayButton())
        }
    }
}

struct GrayButton: ButtonStyle {
    func makeBody(configuration:
        
        Configuration) -> some View {
        configuration.label
            .padding().frame(maxWidth:350)
            .background(Color(red: 242/255, green: 242/255, blue: 247/255))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}



struct ButtonWhiteTextPurple: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .frame(maxWidth: 360, maxHeight:50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}



#Preview {
    ButtonView()
}
