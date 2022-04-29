//
//  ActivityListView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct ActivityListView: View {
    
    private let width = UIScreen.main.bounds.width / 8
    
    var body: some View {
        
        ScrollView() {
            
            VStack(alignment: .leading) {
                
                Text("MBTI 선택")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding()
                
                HStack {
                    ForEach(0 ..< 8) { _ in
                        
                        Button(action: {
                        }) {
                            Text("E")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color.black)
                                .padding()
                        }
                        .frame(maxWidth: width)
                        .aspectRatio(1.0, contentMode: .fit)
                        .background(Color.white)
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
