//
//  CustomText.swift
//  Demo_8
//
//  Created by User on 28.09.2024.
//

import Foundation
import SwiftUI

struct CustomText: View {
    //let placeholder: String
    //  let label: String
    @Binding var text: String
    var body: some View{
        ZStack{
            Text(text: $text)
                .padding(.leading, 10)
                .padding(.top, 45)
                .font(.custom("Roboto-Medium", size: 16))
                .foregroundStyle(.gray)
            
            //            if text == ""{
            //                HStack{
            //                    Text(placeholder)
            //                        .padding()
            //                        .padding(.horizontal, 16)
            //                        .foregroundColor(.gray)
            //                    Spacer()
            //                }
            //            }
        }
    }
}
