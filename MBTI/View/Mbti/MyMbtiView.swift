//
//  MyMbtiView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct MyMbtiView: View {
    
    private let items = [GridItem(), GridItem()]
    
    var body: some View {
        
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                MyMbtiCell()
                    .padding()
                
                Text("MBTI 수치")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding()
                
                LazyVGrid(columns: items, spacing: 8 ,content: {
                    ForEach(0 ..< 4) { _ in
                        MbtiTuneCell()
                    }
                })
                .padding(.horizontal)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("나의 MBTI"))
        
    }
}

struct MyMbtiView_Previews: PreviewProvider {
    static var previews: some View {
        MyMbtiView()
    }
}
