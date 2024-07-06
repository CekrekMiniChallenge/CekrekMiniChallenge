//
//  OBcharacterDummy.swift
//  CekrekMiniChallenge
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 03/07/24.
//

import SwiftUI

struct ExpandableRoundedRectangle: View {
    let title: String
    let description: String
    let isExpanded: Bool
    let onTap: () -> Void
    
    @Binding var valueSelected : Value
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 361, height: isExpanded ? 148 : 77)
                .animation(.easeInOut, value: isExpanded)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(isExpanded ? .title2 : .largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .frame(maxWidth: 361, alignment: .leading)
                    .padding(.horizontal, 36)
                
                if isExpanded {
                    Text(description)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundStyle(.black)
                        .frame(maxWidth: 361, alignment: .leading)
                        .padding(.horizontal, 36)
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut, value: isExpanded)
        }
        .onTapGesture {
            switch title{
            case "Confident":
                valueSelected = .confident
            case "Strong":
                valueSelected = .strong
            case "Friendly":
                valueSelected = .friendly
            case "Genuine":
                valueSelected = .genuine
            default:
                break
            }
            onTap()
        }
    }
}

struct OBcharacterDummy: View {
    @State private var expandedIndex: Int? = nil
    @State var valueSelected : Value
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    VStack {
                        ZStack {
                            
                            VStack {
                                LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .center)
                            }
                            
                            VStack{
                                if valueSelected == .confident{
                                    Text("confident")
                                }else if valueSelected == .friendly{
                                    Text("friendly")
                                }else if valueSelected == .genuine{
                                    Text("genuine")
                                }else if valueSelected == .strong{
                                    Text("strong")
                                }else{
                                    Text("gtw")
                                }
                                Spacer()
                            }
                            
                            VStack {
                                Spacer()
                                Spacer()
                                Text("Which character do you like?")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                Spacer()
                                VStack {
                                    ExpandableRoundedRectangle(
                                        title: "Confident",
                                        description: "For the person who exudes confidence, you possess a natural poise and readiness to engage with the world.",
                                        isExpanded: expandedIndex == 0,
                                        onTap: {
                                            withAnimation {
                                                expandedIndex = (expandedIndex == 0) ? nil : 0
                                            }
                                        }, valueSelected: $valueSelected
                                    )
                                    
                                    ExpandableRoundedRectangle(
                                        title: "Strong",
                                        description: "For the individual who embodies strength, your presence radiates determination and resilience.",
                                        isExpanded: expandedIndex == 1,
                                        onTap: {
                                            withAnimation {
                                                expandedIndex = (expandedIndex == 1) ? nil : 1
                                            }
                                        }, valueSelected: $valueSelected
                                    )
                                    
                                    ExpandableRoundedRectangle(
                                        title: "Friendly",
                                        description: "For the friendly and approachable individual, your warm and inviting nature makes connecting with others effortless.",
                                        isExpanded: expandedIndex == 2,
                                        onTap: {
                                            withAnimation {
                                                expandedIndex = (expandedIndex == 2) ? nil : 2
                                            }
                                        }, valueSelected: $valueSelected
                                    )
                                    
                                    ExpandableRoundedRectangle(
                                        title: "Genuine",
                                        description: "For the authentic individual, your natural and relaxed demeanor reflects your true self.",
                                        isExpanded: expandedIndex == 3,
                                        onTap: {
                                            withAnimation {
                                                expandedIndex = (expandedIndex == 3) ? nil : 3
                                            }
                                        }, valueSelected: $valueSelected
                                    )
                                }
                                Spacer()
                                Spacer()
                                if let expandedIndex = expandedIndex {
                                    NavigationLink(destination: FourCharacter(selectedIndex: expandedIndex, selectedPose: 0, valueSelected: valueSelected).navigationBarBackButtonHidden(false)) {
                                        Text("Next")
                                            .modifier(ButtonWhiteTextPurple())
                                    }
                                } else {
                                    Text("Next")
                                        .modifier(ButtonWhiteTextPurple())
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .navigationBarTitle("", displayMode: .inline)
            .onAppear {
                expandedIndex = nil
            }
        }
    }
}

#Preview {
    OBcharacterDummy(valueSelected: .confident)
}




