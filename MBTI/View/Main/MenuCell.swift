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
       
        HStack() {
            Text(guide)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.black)
        }
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color.white)
        .cornerRadius(20)
        .background(Color.black
            .opacity(0.12)
            .shadow(color: .black, radius: 20, x: 0, y: 4)
            .blur(radius: 10, opaque: false)
        )
        .padding()
    }
}
