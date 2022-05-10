//
//  Data.swift
//  MyHabits
//
//  Created by Lena on 2022/05/05.
//

import Foundation

public class HabitDataClass: ObservableObject {
    
    @Published var myHabits: [HabitData] = load("posts.json")
    

    func addHabit(number:Int, habitTitle: String, memo: String, dateStart: Date, dateEnd: Date, myDecision: String, progressing: Bool, done: Bool, circleCounts: Int) {
        
        let index: Int = myHabits.count
        let newHabit: HabitData = HabitData(
            number: index, habitTitle: habitTitle, memo: memo,
            dateStart: dateStart, dateEnd: dateEnd, myDecision: myDecision,
            progressing: progressing, done: done, circleCounts: 0)
        myHabits.append(newHabit)
        
    }
    
    func changeProgress(number: Int) {
        
        myHabits[number].progressing = true
    }
    
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
