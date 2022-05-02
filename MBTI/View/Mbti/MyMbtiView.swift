//
//  MyMbtiView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct MyMbtiView: View {
    
    private let items = [GridItem(), GridItem()]
    
    var userCheck: Bool {!user.isEmpty}
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var user: FetchedResults<User>
    
    init() {
        _user = FetchRequest<User>(sortDescriptors: [])
    }
    
    var body: some View {
        
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                NavigationLink {
                    SetMbtiView()
                } label: {
                    MyMbtiCell(currentMbti: user[0].currentMbti ?? "설정 필요", goalMbti: user[0].goalMbti ?? "설정 필요")
                        .padding([.top, .horizontal])
                }
                
                Text("MBTI 수치")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .padding(.top, 40)
                
                LazyVGrid(columns: items, spacing: 8 ,content: {
                    MbtiTuneCell(symbol: (user[0].ei < 50 ? "E" : "I") , value: user[0].ei)
                    MbtiTuneCell(symbol: (user[0].ns < 50 ? "N" : "S") , value: user[0].ns)
                    MbtiTuneCell(symbol: (user[0].tf < 50 ? "T" : "F") , value: user[0].tf)
                    MbtiTuneCell(symbol: (user[0].jp < 50 ? "J" : "P") , value: user[0].jp)
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
