//
//  HomeView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct HomeView: View {
    
    var userCheck: Bool {!user.isEmpty}
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var user: FetchedResults<User>
    
    init() {
        _user = FetchRequest<User>(sortDescriptors: [])
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView() {
                
                VStack(alignment: .leading) {
                    
                    NavigationLink {
                        if (userCheck) {
                            MyMbtiView()
                        } else {
                            SetMbtiView()
                        }
                    } label: {
                        TodayMbtiCell(currentMbti: userCheck ? user[0].currentMbti! : "설정 필요")
                            .padding()
                    }
                    
                    Text(Date(), style: .date)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .padding()
                    
                    NavigationLink {
                        TodayActivityView(goalMbti: user[0].goalMbti ?? "")
                    } label: {
                        MenuCell(guide: "오늘의 활동 추천받기")
                    }
                    
                    NavigationLink {
                        UploadActivityView()
                    } label: {
                        MenuCell(guide: "새로운 활동 등록하기")
                    }
                    
                    NavigationLink {
                        ShowActivityView()
                    } label: {
                        MenuCell(guide: "다른 활동 둘러보기")
                    }
                    
                }
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
