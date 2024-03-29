//
//  SetMbtiView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct SetMbtiView: View {
    
    var userCheck: Bool {!user.isEmpty}
    
    
    @State private var ei = 50.0
    @State private var ns = 50.0
    @State private var tf = 50.0
    @State private var jp = 50.0
    
    var mbtiList = ["ENFJ", "ENTJ", "ENFP", "ENTP", "ESFP", "ESFJ", "ESTP", "ESTJ", "INFP", "INFJ", "INTP", "ISTP", "ISFP", "ISFJ", "ISTJ", "INTJ"]
    @State var selectedMbti = "INTJ"
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var user: FetchedResults<User>
    
    private func saveUser() {
        
        do {
            let user = User(context: viewContext)
            
            user.ei = ei
            user.ns = ns
            user.tf = tf
            user.jp = jp
            user.currentMbti = (ei < 50 ? "E" : "I") + (ns < 50 ? "N" : "S") + (tf < 50 ? "T" : "F") + (jp < 50 ? "J" : "P")
            user.goalMbti = selectedMbti
            user.today = Date(timeIntervalSince1970: 300)
            
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func updateUser(_ user: User) {
        
        user.ei = ei
        user.ns = ns
        user.tf = tf
        user.jp = jp
        user.currentMbti = (ei < 50 ? "E" : "I") + (ns < 50 ? "N" : "S") + (tf < 50 ? "T" : "F") + (jp < 50 ? "J" : "P")
        user.goalMbti = selectedMbti
        user.today = Date(timeIntervalSince1970: 300)
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    init() {
        _user = FetchRequest<User>(sortDescriptors: [])
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("현재 MBTI")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .padding()
                    
                    HStack {
                        
                        Text("E")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        CircleSelectView(value: $ei)
                        
                        Text("I")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding([.horizontal, .bottom])
                    
                    HStack {
                        
                        Text("N")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        CircleSelectView(value: $ns)
                        
                        Text("S")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding()
                    
                    HStack {
                        
                        Text("T")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        CircleSelectView(value: $tf)
                        
                        Text("F")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding()
                    
                    HStack {
                        
                        Text("J")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        CircleSelectView(value: $jp)
                        
                        Text("P")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding()
                    
                }
                
                VStack(alignment: .leading) {
                
                    Text("목표 MBTI ")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    Picker("목표 MBTI를 선택해주세요.", selection: $selectedMbti) {
                        ForEach(mbtiList, id: \.self) {
                            Text($0)
                        }
                    }
                    .padding(.horizontal)
                    
                }
                
                Button(action: {
                    userCheck ? updateUser(user[0]) : saveUser()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("설정 완료")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.black)
                        .cornerRadius(20)
                        .background(Color.black
                            .opacity(0.05)
                            .shadow(color: .black, radius: 20, x: 0, y: 4)
                            .blur(radius: 10, opaque: false)
                        )
                        .padding()
                        .padding(.top, 40)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("MBTI 설정"))
        }
    }
}

struct SetMbtiView_Previews: PreviewProvider {
    static var previews: some View {
        SetMbtiView()
    }
}
