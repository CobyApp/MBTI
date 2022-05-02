//
//  UploadActivityView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct UploadActivityView: View {
    
    @State private var mbtiClicked: String = ""
    @State private var isSelected = [Bool](repeating: false, count: 8)
    
    @State private var newActivity: String = ""
    @State private var rating: Int = 0
    
    private let mbti = ["E", "I", "N", "S", "T", "F", "J", "P"]
    private let items = [GridItem(), GridItem(), GridItem(), GridItem()]
    private let width = (UIScreen.main.bounds.width - 56) / 4
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
    private func saveActivity() {
        
        do {
            let activity = Activity(context: viewContext)
            activity.goal = mbtiClicked
            activity.mission = newActivity
            activity.effect = Int16(rating)
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    var body: some View {
        
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                Text("MBTI 선택")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding()
                
                LazyVGrid(columns: items, spacing: 8 ,content: {
                    ForEach(0 ..< 8) { index in
                        
                        Button(action: {
                            self.isSelected = [Bool](repeating: false, count: 8)
                            self.isSelected[index] = true
                            mbtiClicked = mbti[index]
                        }) {
                            Text(mbti[index])
                                .font(.system(size: 40, weight: .semibold))
                                .foregroundColor(self.isSelected[index] ? Color.white : Color.black)
                                .padding()
                                .frame(width: width, height: width)
                                .background(self.isSelected[index] ? Color.pointColor : Color.white)
                                .cornerRadius(30)
                                .background(Color.black
                                    .opacity(0.04)
                                    .shadow(color: .black, radius: 30, x: 0, y: 4)
                                    .blur(radius: 10, opaque: false)
                                )
                        }
                    }
                })
                .padding(.horizontal)
                
                Text("활동 입력")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .padding(.top, 40)
                
                TextField("활동을 입력해주세요.", text: $newActivity)
                    .font(.system(size: 16, weight: .regular))
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .background(Color.white)
                    .cornerRadius(20)
                    .background(Color.black
                        .opacity(0.05)
                        .shadow(color: .black, radius: 20, x: 0, y: 4)
                        .blur(radius: 10, opaque: false)
                    )
                    .padding(.horizontal)
                
                Text("활동 중요도")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .padding(.top, 40)
                
                StarRatingView(rating: $rating)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    saveActivity()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("등록 완료")
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
                        .padding(.top, 40)
                }
                .padding()
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("활동 등록하기"))
        
    }
}

struct UploadActivityView_Previews: PreviewProvider {
    static var previews: some View {
        UploadActivityView()
    }
}
