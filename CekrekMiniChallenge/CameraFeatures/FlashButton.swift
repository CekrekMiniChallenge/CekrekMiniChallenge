//
//  FlashButton.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 04/07/24.
//

import SwiftUI

struct FlashButton: View {
    @State var isFlashActive = false
    @State var isExpanded = false
    
    var body: some View {
        HStack{
            if isExpanded{
                Image(systemName: "bolt.fill")
                    .foregroundStyle(isFlashActive ? .yellow : .black)
                    .font(.title)
                    .padding(.leading, 5)
                    .onTapGesture {
                        withAnimation{
                            isExpanded.toggle()
                        }
                    }
                Spacer().frame(width: 50)
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isFlashActive = true
                    }
                } label: {
                    Text("On")
                        .foregroundStyle(isFlashActive ? .yellow : .black)
                    Spacer().frame(width: 50)
                }
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isFlashActive = false
                    }
                } label: {
                    Text("Off")
                        .padding(.trailing, 5)
                }
            }else{
                Image(systemName: "bolt.fill")
                    .foregroundStyle(isFlashActive ? .yellow : .black)
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        withAnimation{
                            isExpanded.toggle()
                        }
                    }
            }
        }
        .frame(height: 30)
        .padding(10)
        .background(.black.opacity(0.5))
        .foregroundColor(.black)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .animation(.spring(), value: isExpanded)
    }
}

#Preview {
    FlashButton()
}
