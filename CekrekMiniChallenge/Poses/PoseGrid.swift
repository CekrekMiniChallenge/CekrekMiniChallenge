//
//  PoseGrid.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 07/07/24.
//

import SwiftUI

struct PoseGrid: View {
    @State var value : Value
    @Binding var pose : Int
    
    var body: some View {
        LazyVGrid(columns:[GridItem(), GridItem(), GridItem()]){
            if pose == 0{
                PoseItem(value: value.imgSample[0])
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 4)
                            .opacity(0.8)
                    }
            }else{
                PoseItem(value: value.imgSample[0])
                    .onTapGesture {
                        self.pose = 0
                    }
            }
            
            if pose == 1 {
                PoseItem(value: value.imgSample[1])
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 4)
                            .opacity(0.8)
                    }
            }else{
                PoseItem(value: value.imgSample[1])
                    .onTapGesture {
                        self.pose = 1
                    }
            }
            
            if pose == 2 {
                PoseItem(value: value.imgSample[2])
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 4)
                            .opacity(0.8)
                    }
            }else {
                PoseItem(value: value.imgSample[2])
                    .onTapGesture {
                        self.pose = 2
                    }
            }
//            ForEach(value.imgSample, id: \.self){ val in
//                PoseItem(value: val)
//                    .onTapGesture {
//                        
//                    }
//            }
//            ForEach(Value.allCases){ val in
//                if self.value == val {
//                    PoseItem(value: <#T##String#>)
//                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                        .overlay{
//                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                                .stroke(lineWidth: 3)
//                                .opacity(0.5)
//                        }
//                }else{
//                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
//                        .onTapGesture {
//                            self.currency = currency
//                        }
//                }
//            }
        }
    }
}

#Preview {
    PoseGrid(value: .confident, pose: .constant(0))
}
