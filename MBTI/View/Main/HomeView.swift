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
                    
                    NavigationLink {
                        MyMbtiView()
                    } label: {
                        MyMbtiCardView()
                    }
                    
                    NavigationLink {
                        TodayActivityView()
                    } label: {
                        MenuCell(guide: "오늘의 활동은?")
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
            .opacity(0.12)
            .shadow(color: .black, radius: 34, x: 0, y: 4)
            .blur(radius: 100, opaque: false)
        )
        .padding()
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
