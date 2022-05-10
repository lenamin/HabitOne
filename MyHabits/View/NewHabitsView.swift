//
//  NewHabitsView.swift
//  60_Habbits
//
//  Created by Lena on 2022/04/29.
//

import SwiftUI

struct NewHabitsView: View {

    @Binding var index: Int
    @EnvironmentObject var singleHabit: HabitDataClass
    @Environment(\.presentationMode) var presentationMode

       
    var body: some View {
        ZStack {
            Color(red: 116 / 255, green: 124 / 255, blue: 128 / 255).ignoresSafeArea().opacity(0.03)
            VStack {
                Text("새로운 습관을 등록하고 나의 습관으로 만들어보세요.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top)
                
                VStack { // 새로운 습관
                    HStack {
                        Text("새로운 습관")
                            .fontWeight(.semibold)
                            .font(.title2)
                        Spacer()
                    }
                    
                    TextField("새로운 습관을 입력하세요", text: $singleHabit.myHabits[index].habitTitle)
                        .padding(.vertical, 10)
                        .padding(.leading, 5)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                } // VStack
                .padding()
                
                VStack {
                    HStack {
                        Text("메모")
                            .font(.title3)
                        Spacer()
                    }
                    
                    TextField("달성하고자 하는 목표를 입력해보세요", text: $singleHabit.myHabits[index].memo)
                        .padding(.vertical, 10)
                        .padding(.leading, 5)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                } // VStack
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Text("진행기간")
                            .font(.title3)
                        Spacer()
                    }
                    HStack {
                        DatePicker("", selection: $singleHabit.myHabits[index].dateStart,displayedComponents: .date)
                            .background(.white)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                        Text("~")
                        DatePicker("", selection: $singleHabit.myHabits[index].dateEnd, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                    }// DatePicker HStack
                    
                } // VStack
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Text("나의 마음가짐")
                            .font(.title3)
                        Spacer()
                    }
                    
                    TextEditor(text: $singleHabit.myHabits[index].myDecision)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.25)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .padding(.leading, 5)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5))
                    
                        
                } // VStack
                .padding(.horizontal)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    singleHabit.changeProgress(number: index)
                    singleHabit.myHabits.append(singleHabit.myHabits[index])
                }, label: {
                    Text("등록하기")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(UIScreen.main.bounds.height * 0.02)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 255 / 255, green: 202 / 255, blue: 87 / 255))
                    
                })
            } // VStack all
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ZStack {
                        Text("오늘의 습관")
                            .font(.title3)
                            .fontWeight(.bold)
                    } // toolbar ZStack
                    //.ignoresSafeArea(.all)
                }
            } // toolbar
        } //ZStack
        
    }
    
    
    

    
}

//struct NewHabitsView_Previews: PreviewProvider {
//    static var previews: some View {
//        //NewHabitsView()
//    }
//}
