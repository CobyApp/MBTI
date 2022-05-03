//
//  MBTIApp.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

@main
struct MBTIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
