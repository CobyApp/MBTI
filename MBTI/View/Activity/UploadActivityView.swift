//
//  UploadActivityView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct UploadActivityView: View {
    
    @State var activity: String = ""
    @State var rating: Int = 0
    
    private let items = [GridItem(), GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                Text("MBTI 선택")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding()
                
                LazyVGrid(columns: items, spacing: 8 ,content: {
                    ForEach(0 ..< 8) { _ in
                        
                        Button(action: {
                        }) {
                            Text("E")
                                .font(.system(size: 40, weight: .semibold))
                                .foregroundColor(Color.black)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .background(Color.white)
                        .cornerRadius(30)
                        .background(Color.black
                            .opacity(0.04)
                            .shadow(color: .black, radius: 30, x: 0, y: 4)
                            .blur(radius: 10, opaque: false)
                        )
                    }
                })
                .padding(.horizontal)
                
                Text("활동 입력")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .padding(.top, 40)
                
                TextField("활동을 입력해주세요.", text: $activity)
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
                    .padding()
                    .padding(.top, 20)
                
                StarRatingView(rating: $rating)
                    .padding()
                
                Spacer()
                
                Button(action: {
                }) {
                    Text("등록 완료")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .background(Color.black)
                        .cornerRadius(20)
                        .background(Color.black
                            .opacity(0.05)
                            .shadow(color: .black, radius: 20, x: 0, y: 4)
                            .blur(radius: 10, opaque: false)
                        )
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
