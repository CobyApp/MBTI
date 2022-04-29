//
//  MenuCell.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct MenuCell: View {
    
    let guide: String
    
    var body: some View{
       
        HStack {
            Text(guide)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.black)
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .foregroundColor(Color.black)
        }
        .padding([.vertical], 30)
        .padding([.horizontal], 20)
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color.white)
        .cornerRadius(20)
        .background(Color.black
            .opacity(0.05)
            .shadow(color: .black, radius: 20, x: 0, y: 4)
            .blur(radius: 10, opaque: false)
        )
        .padding(.horizontal)
    }
}
