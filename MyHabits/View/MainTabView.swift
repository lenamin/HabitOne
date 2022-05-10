//
//  ContentView.swift
//  MyHabits
//
//  Created by Lena on 2022/05/05.
//

import Foundation
import SwiftUI

struct MainTabView: View {

    @EnvironmentObject var singleHabit: HabitDataClass

    init() {
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    var body: some View {

        TabView {
            ProgressingHabitsView()
                .tabItem {
                    Label("진행중", systemImage: "hourglass")
                        .foregroundColor(.gray)
                }
            
            FinishedHabitsView()
                .tabItem {
                    Label("완료", systemImage: "checkmark.square.fill")
                        .foregroundColor(.gray)
                }
        } // TabView
        .accentColor(.orange)
        .background(Color.white)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
