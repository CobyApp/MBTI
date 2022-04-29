//
//  PieChart.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/30.
//

import SwiftUI

struct PieChart : View {
    
    let symbol: String
    
    var body: some View {
        
        VStack {
            ZStack {
                
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(Color.pointColor, lineWidth: 10)
                
                Circle()
                    .trim(from: 0.7, to: 1)
                    .stroke(Color(hex: "#E6E6E6"), lineWidth: 10)
                
                Text(symbol)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(Color.black)
                
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
        }
        
    }
}
