//
//  MyMbtiView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct MyMbtiView: View {
    var body: some View {
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                AllMbtiCardView()
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("나의 MBTI"))
    }
}

struct AllMbtiCardView: View{
    var body: some View{
       
        VStack(alignment: .center) {
            
            HStack {
                
                VStack {
                    
                    Text("현재")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                    
                    Image("enfj")
                        .resizable()
                        .scaledToFit()
                    
                    Text("ENFJ")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(Color.black)
                }
                
                Spacer()
                
                VStack {
                    
                    Text("목표")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                    
                    Image("enfj")
                        .resizable()
                        .scaledToFit()
                    
                    Text("ISTP")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(Color.black)
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            
            Divider()
            
            Text("오늘은 I 활동을 좀 더 해보세요.")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.black)
                .padding()
            
        }
        .padding()
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

struct MyMbtiView_Previews: PreviewProvider {
    static var previews: some View {
        MyMbtiView()
    }
}
