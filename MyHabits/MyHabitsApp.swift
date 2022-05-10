//
//  MyHabitsApp.swift
//  MyHabits
//
//  Created by Lena on 2022/05/05.
//

import SwiftUI

@main
struct MyHabitsApp: App {
    
    @StateObject var singleHabit: HabitDataClass = HabitDataClass()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(HabitDataClass())
        }
    }
}
