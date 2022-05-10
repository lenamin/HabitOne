
import SwiftUI

// Finished Habit
// Main

struct FinishedHabitsView: View {
    
    @EnvironmentObject var singleHabit: HabitDataClass
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(.white)
    } // to change background color of toolbar
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 116 / 255, green: 124 / 255, blue: 128 / 255).opacity(0.08).ignoresSafeArea(.all)
                ScrollView(){
                    LazyVStack {
                        ForEach(3..<5, id:\.self) {
                            index in
                            
                            NavigationLink(destination: SixtyHabitsView(index: $singleHabit.myHabits[index].number), label: {
                                
                                // Habit card
                                //--------------------------------------------------------//
                                ZStack {
                                    RoundedRectangle(cornerRadius: 19)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray.opacity(0.5), radius: 2, x: 2, y: 2)
                                        .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.15, alignment: .center)
                                    
                                    
                                    HStack(alignment: .center) {
                                        VStack(alignment: .leading) { // Habit Title & Memo
                                            Text(singleHabit.myHabits[index].habitTitle)
                                                .font(.title2)
                                                .fontWeight(.heavy)
                                                .foregroundColor(.black)
                                            
                                            Text(singleHabit.myHabits[index].memo)
                                                .fontWeight(.light)
                                                .frame(alignment: .leading)
                                                .foregroundColor(.black)
                                        } // Vstack
                                        ZStack {
                                            Circle()
                                                .stroke(lineWidth: 10.0)
                                                .opacity(0.3)
                                                .foregroundColor(Color.orange)
                                            
                                            Circle()
                                                .trim(from:0.0, to:CGFloat(Double(singleHabit.myHabits[index].circleCounts)/60))
                                                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                .foregroundColor(Color.orange)
                                                .animation(Animation.linear(duration:2.0))
                                            
                                            HStack(spacing: 1) {
                                                Text(String(format: "%.0f", CGFloat(Double(singleHabit.myHabits[index].circleCounts)/60 * 100)))
                                                    .font(.title)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Text("%")
                                                    .font(.caption)
                                                    .fontWeight(.light)
                                                    .foregroundColor(.black)
                                                
                                            }
                                        }
                                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.15 )
                                        .padding(.vertical)
                                        .padding(.horizontal)
                                    } //HStack
                                    
                                }//ZStack
                                //--------------------------------------------------------//
                                //Habit card
                                
                            }) // NavigationLink
                            .navigationBarTitleDisplayMode(.inline)
                            
                        } //Loop
                        
                        //                       .onDelete(perform: _)
                    } //VStack
                }
            } // ZStack
            
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ZStack {
                        Text("내가 만든 습관")
                            .font(.title3)
                            .fontWeight(.bold)
                    } // toolbar ZStack
                    .ignoresSafeArea(.all)
                }
            } // toolbar
            
        } // ZStack
    }
    
    
} // NavigationView



/*
 ZStack {
 Color(red: 116 / 255, green: 124 / 255, blue: 128 / 255).opacity(0.08).ignoresSafeArea(.all)
 
 LazyVStack {
 ScrollView {
 NavigationLink(destination: SixtyHabitsView(index: .constant(3)), label: {
 // Habit card
 //--------------------------------------------------------//
 ZStack {
 RoundedRectangle(cornerRadius: 19)
 .foregroundColor(.white)
 .shadow(color: .gray.opacity(0.5), radius: 2, x: 2, y: 2)
 .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .center)
 
 HStack {
 VStack { // Habit Title & Memo
 Text(singleHabit.myHabits[3].habitTitle )
 .font(.title2)
 .fontWeight(.heavy)
 .foregroundColor(.black)
 //.padding(.leading, 10)
 
 Text(singleHabit.myHabits[3].memo )
 .fontWeight(.light)
 .frame(alignment: .leading)
 .foregroundColor(.black)
 } // Vstack
 ZStack {
 Circle()
 .stroke(lineWidth: 10.0)
 .opacity(0.3)
 .foregroundColor(Color.orange)
 Circle()
 .trim(from:0.0, to:CGFloat(min(Float((singleHabit.myHabits[3].circleCounts / 60) * 100), 100.0)))
 .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
 .foregroundColor(Color.orange)
 
 HStack(spacing: 1) {
 Text(String(format: "%.0f",Double((singleHabit.myHabits[3].circleCounts / 60) * 100)))
 .font(.title)
 .bold()
 .foregroundColor(.black)
 Text("%")
 .font(.caption)
 .fontWeight(.light)
 .foregroundColor(.black)
 }
 }
 .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.15 )
 .padding()
 } //HStack
 }//ZStack
 .toolbar {
 ToolbarItem(placement: .principal) {
 Text("내가 만든 습관")
 .font(.title3)
 .fontWeight(.bold)
 }
 } // toolbar
 .padding()
 //--------------------------------------------------------//
 //Habit card
 .navigationBarTitleDisplayMode(.inline)
 }) // NavigationLink
 }//ScrollView
 } //Loop
 } //VStack
 .padding()
 
 
 
 
 
 
 
 */

//.background(Color(red: 116 / 255, green: 124 / 255, blue: 128 / 255).opacity(0.08))



//struct FinishedHabitsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}

