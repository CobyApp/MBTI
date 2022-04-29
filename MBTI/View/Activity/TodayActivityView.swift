//
//  TodayActivityView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct TodayActivityView: View {
    var body: some View {
        
        VStack {
            
            Image("ENFJ")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300)
                .aspectRatio(1.0, contentMode: .fit)
                .padding(.top, 50)
            
            Spacer()
            
            Text("감상문 쓰기")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(Color.black)
                .padding(.bottom, 50)
            
            NavigationLink {
            } label: {
                MenuCell(guide: "홈화면으로 돌아가기")
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("오늘의 활동"))
        
    }
}

struct TodayActivityView_Previews: PreviewProvider {
    static var previews: some View {
        TodayActivityView()
    }
}
