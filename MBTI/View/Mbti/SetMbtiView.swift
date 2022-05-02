//
//  SetMbtiView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct SetMbtiView: View {
    
    @State private var ei = 6.0
    @State private var ns = 6.0
    @State private var tf = 6.0
    @State private var jp = 6.0
    
    var mbtiList = ["ENFJ", "ENTJ", "ENFP", "ENTP", "ESFP", "ESFJ", "ESTP", "ESTJ", "INFP", "INFJ", "INTP", "ISTP", "ISFP", "ISFJ", "ISTJ", "INTJ"]
    @State var selectedMbti = "ENFJ"
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.gray
        
        let attributes: [NSAttributedString.Key:Any] = [
            //원하는 색상
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
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
                        
                        SliderView(value: $ei)
                            .frame(maxWidth: .infinity, maxHeight: 30)
                        
                        Text("I")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                    }.padding()
                    
                    HStack {
                        
                        Text("N")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 20)
                        
                        SliderView(value: $ns)
                            .frame(maxWidth: .infinity, maxHeight: 30)
                        
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
                        
                        SliderView(value: $tf)
                            .frame(maxWidth: .infinity, maxHeight: 30)
                        
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
                        
                        SliderView(value: $jp)
                            .frame(maxWidth: .infinity, maxHeight: 30)
                        
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
                    
                    Picker("목표 MBTI를 선택해주세요.", selection: $selectedMbti) {
                        ForEach(mbtiList, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                .padding(.top, 20)
                .padding()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("설정 완료")
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
                        .padding(.top, 40)
                }
                .padding()
                
            }
        }
        
    }
}

struct SetMbtiView_Previews: PreviewProvider {
    static var previews: some View {
        SetMbtiView()
    }
}
