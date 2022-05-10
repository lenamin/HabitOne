//
//  SixtyHabitsView.swift
//  MyHabits
//
//  Created by Lena on 2022/05/05.
//


import Foundation
import SwiftUI

struct SixtyHabitsView: View {
    @EnvironmentObject var singleHabit: HabitDataClass
    @State var positions: [Positions] = []
    @Binding var index: Int
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        ZStack {
            WaveView()
                .padding()
            VStack {
                Text(singleHabit.myHabits[index].memo)
                    .font(.title3)
                Text(" \(singleHabit.myHabits[index].dateStart, formatter: dateFormatter) ~ \(singleHabit.myHabits[index].dateEnd, formatter: dateFormatter)")
                ZStack {
                    RoundedRectangle(cornerRadius: 19)
                        .foregroundColor(.white)
                        .shadow(color: .gray.opacity(0.5), radius: 2, x: 2, y: 2)
                        .frame(width: UIScreen.main.bounds.width * 0.8,height: UIScreen.main.bounds.height * 0.6, alignment: .center)
                    
                    //---------------------// Grid
                    let row: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20.0, maximum: 40.0), spacing: 5, alignment: nil), count: 10)
                    
                    LazyHGrid(rows: row, alignment: .center, spacing: 15) {
                        ForEach(Positions.allCases, id: \.self) { position in
                            Button(action: {
                                if positions.contains(position) {
                                    positions.removeAll { $0 == position }
                                    singleHabit.myHabits[index].circleCounts -= 1
                                } else {
                                    positions.append(position)
                                    singleHabit.myHabits[index].circleCounts += 1
                                }
                            }, label: {
                                if positions.contains(position) {
                                    Image("OvalSelected")
                                } else {
                                    Image("OvalUnselected")
                                }
                                
                            })

                        } // Loop
                    } // -------------------------------- Grid
                    .padding(.horizontal, 10)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    
                } // ZStack
            } //VStack

        } // ZStack
        .toolbar {
            ToolbarItem(placement: .principal) {
                ZStack {
                    Text(singleHabit.myHabits[index].habitTitle )
                        .font(.title3)
                        .fontWeight(.bold)
                } // toolbar ZStack
                .ignoresSafeArea(.all)
            }
        } // toolbar
    }
}
