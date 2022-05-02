//
//  MyMbtiCell.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/30.
//

import SwiftUI

struct MyMbtiCell: View{
    
    var currentMbti: String
    var goalMbti: String
    
    let randomInt1 = Int.random(in: 0..<4)
    let randomInt2 = Int.random(in: 0..<4)
    let randomInt3 = Int.random(in: 0..<4)
    
    let comment1 = ["오늘은", "오늘 하루는", "열심히", "즐겁게"]
    let comment2 = ["활동을 좀 더 해보세요.", "수치를 채워봐요.", "활동을 잘 하고 있어요.", " 활동을 도전해보세요."]
    
    var body: some View{
       
        VStack(alignment: .center) {
            
            HStack {
                
                MbtiVCell(time: "현재", mbti: currentMbti)
                
                Spacer()
                
                MbtiVCell(time: "목표", mbti: goalMbti)
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            
            Divider()
            
            Text("\(comment1[randomInt1]) \(String(goalMbti[goalMbti.index(goalMbti.startIndex, offsetBy: randomInt2)])) \(comment2[randomInt3])")
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
    }

}

struct MbtiVCell: View {
    
    let time: String
    let mbti: String
    
    var body: some View{
       
        VStack {
            
            Text(time)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.black)
            
            Image("ENFJ")
                .resizable()
                .scaledToFit()
            
            Text(mbti)
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(Color.black)
        }
        
    }
}
