//
//  ActivityListView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct ActivityListView: View {
    
    @State private var mbtiClicked: String = ""
    @State private var isSelected = [true] + [Bool](repeating: false, count: 7)
    
    private let mbti = ["E", "I", "N", "S", "F", "T", "J", "P"]    
    private let width = (UIScreen.main.bounds.width - 88) / 8
    
    var body: some View {
        
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                Text("MBTI 선택")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding()
                
                HStack {
                    ForEach(0 ..< 8) { index in
                        
                        Button(action: {
                            self.isSelected = [Bool](repeating: false, count: 8)
                            self.isSelected[index] = true
                            mbtiClicked = mbti[index]
                        }) {
                            Text(mbti[index])
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(self.isSelected[index] ? Color.white : Color.black)
                        }
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
                .padding(.horizontal)
                
                Text("활동 목록")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding()
                    .padding(.top, 20)
                
                ForEach(0 ..< 8) { _ in
                    
                    Button(action: {
                    }) {
                        Text("감상문을 적어주세요.")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.black)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(20)
                            .background(Color.black
                                .opacity(0.05)
                                .shadow(color: .black, radius: 20, x: 0, y: 4)
                                .blur(radius: 10, opaque: false)
                            )
                    }
                    
                }.padding(.horizontal)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("활동 둘러보기"))
        
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView()
    }
}
