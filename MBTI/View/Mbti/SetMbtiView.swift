//
//  SetMbtiView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct SetMbtiView: View {
    
    @State private var currentValue = 6.0
    
    var body: some View {
        
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                Text("현재 MBTI 수치")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding()
                
                HStack {
                    
                    Text("E")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                    SliderView(value: $currentValue)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                    
                    Text("F")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                }.padding()
                
                HStack {
                    
                    Text("E")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                    SliderView(value: $currentValue)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                    
                    Text("F")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                }.padding()
                
                HStack {
                    
                    Text("E")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                    SliderView(value: $currentValue)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                    
                    Text("F")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                }.padding()
                
                HStack {
                    
                    Text("E")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                    SliderView(value: $currentValue)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                    
                    Text("F")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                }.padding()
                
            }
        }
        
    }
}

struct SetMbtiView_Previews: PreviewProvider {
    static var previews: some View {
        SetMbtiView()
    }
}
