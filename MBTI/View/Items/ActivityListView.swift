//
//  ActivityListView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct ActivityListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest var activities: FetchedResults<Activity>
    
    init(filter: String) {
        _activities = FetchRequest<Activity>(sortDescriptors: [], predicate: NSPredicate(format: "goal == %@", filter))
        
        do {
            let result = try viewContext.fetch(_activities)
            if result.isEmpty {
                print("data not exist")
                return
            } else {
                print("data exist")
            }
            
        } catch {
            print(error)
        }
    }
    
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
}
