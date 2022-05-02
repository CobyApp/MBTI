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
    @State var selectedMbti = "ENFJ"
    
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
        
        ScrollView() {
            
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
                        
                        Slider(value: $ei, in: 0...100, step: 1)
                            .padding()
                            .accentColor(Color.pointColor)
                            .foregroundColor(Color(hex: "#FF5757"))
                        
                        Text("I")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding(.horizontal)
                    
                    HStack {
                        
                        Text("N")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        Slider(value: $ns, in: 0...100, step: 1)
                            .padding()
                            .accentColor(Color.pointColor)
                        
                        Text("S")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding(.horizontal)
                    
                    HStack {
                        
                        Text("T")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        Slider(value: $tf, in: 0...100, step: 1)
                            .padding()
                            .accentColor(Color.pointColor)
                        
                        Text("F")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding(.horizontal)
                    
                    HStack {
                        
                        Text("J")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        Slider(value: $jp, in: 0...100, step: 1)
                            .padding()
                            .accentColor(Color.pointColor)
                        
                        Text("P")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding(.horizontal)
                    
                }
                
                VStack(alignment: .leading) {
                
                    Text("목표 MBTI ")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.black)
                        .padding()
                    
                    Picker("목표 MBTI를 선택해주세요.", selection: $selectedMbti) {
                        ForEach(mbtiList, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(WheelPickerStyle())
                    
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
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("MBTI 재설정"))
        
    }
}

struct SetMbtiView_Previews: PreviewProvider {
    static var previews: some View {
        SetMbtiView()
    }
}
