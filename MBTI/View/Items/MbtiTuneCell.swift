//
//  MbtiTuneCell.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/30.
//

import SwiftUI

struct MbtiTuneCell: View {
    
    var body: some View {
        
        VStack(alignment: .center) {
            PieChart(symbol: "E")
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
