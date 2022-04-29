//
//  HomeView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ScrollView() {
                
                VStack(alignment: .leading) {
                    
                    MyMbtiCardView()
                    
                    Text(Date(), style: .date)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .padding()
                    
                    NavigationLink {
                        MyMbtiView()
                    } label: {
                        MenuCell(guide: "나의 MBTI 분석하기")
                    }
                    
                    NavigationLink {
                        TodayActivityView()
                    } label: {
                        MenuCell(guide: "오늘의 활동 추천받기")
                    }
                    
                    NavigationLink {
                        UploadActivityView()
                    } label: {
                        MenuCell(guide: "새로운 활동 등록하기")
                    }
                    
                    NavigationLink {
                        ActivityListView()
                    } label: {
                        MenuCell(guide: "다른 활동 둘러보기")
                    }
                    
                }
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct MyMbtiCardView: View{
    var body: some View{
       
        VStack(alignment: .center) {
            
            Image("enfj")
                .resizable()
                .scaledToFit()
            
            Text("ENFJ")
                .font(.system(size: 40, weight: .semibold))
                .foregroundColor(Color.black)
            
        }
        .padding(40)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
