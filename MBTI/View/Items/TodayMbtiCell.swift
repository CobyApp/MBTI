//
//  TodayMbtiCell.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/30.
//

import SwiftUI

struct TodayMbtiCell: View{
    
    var body: some View{
       
        VStack(alignment: .center) {
            
            Image("ENFJ")
                .resizable()
                .scaledToFit()
            
            Text("ENFJ")
                .font(.system(size: 40, weight: .semibold))
                .foregroundColor(Color.black)
            
        }
        .padding(40)
        .frame(maxWidth: .infinity)
        .aspectRatio(1.0, contentMode: .fit)
        .background(Color.white)
        .cornerRadius(34)
        .background(Color.black
            .opacity(0.08)
            .shadow(color: .black, radius: 34, x: 0, y: 4)
            .blur(radius: 30, opaque: false)
        )
        .padding()
    }

}
