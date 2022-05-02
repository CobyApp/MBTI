//
//  MbtiTuneCell.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/30.
//

import SwiftUI

struct MbtiTuneCell: View {
    
    let symbol: String
    let value: Double
    
    var body: some View {
        
        VStack(alignment: .center) {
            PieChart(symbol: symbol, value: value)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .aspectRatio(1.0, contentMode: .fit)
        .background(Color.white)
        .cornerRadius(34)
        .background(Color.black
            .opacity(0.08)
            .shadow(color: .black, radius: 34, x: 0, y: 4)
            .blur(radius: 30, opaque: false)
        )
        
    }
}

struct PieChart : View {
    
    let symbol: String
    let value: Double
    
    var body: some View {
        
        VStack {
            ZStack {
                
                Circle()
                    .trim(from: 0, to: value / 100.0)
                    .stroke(Color.pointColor, lineWidth: 10)
                
                Circle()
                    .trim(from: value / 100.0, to: 1)
                    .stroke(Color(hex: "#FF5757"), lineWidth: 10)
                
                Text(symbol)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(Color.black)
                
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
        }
        
    }
}
