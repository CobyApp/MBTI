//
//  TodayActivityView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct TodayActivityView: View {
    
    var activityCheck: Bool {!activities.isEmpty}
    var day = Int(Calendar.current.dateComponents([.day], from: Date()).day ?? 0)
    var commendIndex: Int { day % activities.count }
    var activity: Activity { activities[commendIndex] }
    
    var rating: Int { Int(activity.effect) }
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color(hex: "#C4C4C4")
    var onColor = Color.pointColor
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest var activities: FetchedResults<Activity>
    
    init(goalMbti: String) {
        
        let predicate1:NSPredicate = NSPredicate(format: "goal == %@", String(goalMbti[goalMbti.index(goalMbti.startIndex, offsetBy: 0)]))
        let predicate2:NSPredicate = NSPredicate(format: "goal == %@", String(goalMbti[goalMbti.index(goalMbti.startIndex, offsetBy: 1)]))
        let predicate3:NSPredicate = NSPredicate(format: "goal == %@", String(goalMbti[goalMbti.index(goalMbti.startIndex, offsetBy: 2)]))
        let predicate4:NSPredicate = NSPredicate(format: "goal == %@", String(goalMbti[goalMbti.index(goalMbti.startIndex, offsetBy: 3)]))
        
        _activities = FetchRequest<Activity>(sortDescriptors: [], predicate: NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1, predicate2, predicate3, predicate4]))
    }
    
    var body: some View {
        
        VStack {
            
            if (activityCheck) {
            
                VStack {
                
                    Image("ENFJ")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .aspectRatio(1.0, contentMode: .fit)
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    Text(activity.mission ?? "")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(Color.black)
                        .padding()
                    
                    HStack {
                        ForEach(1..<6, id: \.self) { number in
                            image(for: number)
                                .font(.system(size: 40))
                                .frame(maxWidth: .infinity)
                                .foregroundColor(number > rating ? offColor : onColor)
                        }
                    }.padding()
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("활동을 완료했어요.")
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
                
            } else {
                
                Text("저장된 활동 없음")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color.black)
                    .padding(.bottom, 50)
                
            }
                
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("오늘의 활동"))
        
    }
}
