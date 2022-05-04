//
//  CircleSelectView.swift
//  Be
//
//  Created by COBY_PRO on 2022/05/04.
//

import SwiftUI

struct CircleSelectView: View {
    
    @Binding var value: Double
    
    var offColor = Color(hex: "#C4C4C4")
    var onColor = Color.pointColor
    
    var body: some View {
        
        HStack {
            
            ForEach(0..<5, id: \.self) { number in
                Circle()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(value == Double(number * 25) ? onColor : offColor)
                    .onTapGesture {
                        value = Double(number * 25)
                    }
            }
            
        }
        
    }
}
