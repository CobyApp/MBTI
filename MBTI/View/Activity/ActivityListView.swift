//
//  ActivityListView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct ActivityListView: View {
    
    @State private var mbtiClicked: String = "E"
    @State private var isSelected = [true] + [Bool](repeating: false, count: 7)
    
    private let mbti = ["E", "I", "N", "S", "F", "T", "J", "P"]
    private let width = (UIScreen.main.bounds.width - 88) / 8
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Activity.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "goal == %@", "E")
    ) var activities: FetchedResults<Activity>
    
    private func deleteActivity(at offsets: IndexSet) {
        offsets.forEach { index in
            let activity = activities[index]
            viewContext.delete(activity)
            
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
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
            }
            .padding(.horizontal)
            
            List {
                
                ForEach(activities) { activity in
                    Text(activity.mission ?? "")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
                }.onDelete(perform: deleteActivity)
                
            }
            .listRowBackground(Color.clear)
            
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
