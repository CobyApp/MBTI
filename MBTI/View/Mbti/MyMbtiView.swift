//
//  MyMbtiView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct MyMbtiView: View {
    
    private let items = [GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 2
    
    var body: some View {
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                MyMbtiCell()
                
                LazyVGrid(columns: items, spacing: 2 ,content: {
                    ForEach(0 ..< 4) { _ in
                        Image("enfj")
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    }
                })
                
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
