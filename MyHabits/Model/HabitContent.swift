//
//  HabitContent.swift
//  MyHabits
//
//  Created by Lena on 2022/05/05.
//

import Foundation
import SwiftUI

struct HabitData: Codable, Identifiable {
    
    var id = UUID()
    var number: Int // number of habits
    var habitTitle: String
    var memo: String
    var dateStart: Date
    var dateEnd: Date
    var myDecision: String
    
    // status check
    var progressing: Bool
    var done: Bool
    
    var circleCounts:Int
    
    
    enum CodingKeys: CodingKey {
        case number
        case habitTitle
        case memo
        case dateStart
        case dateEnd
        case myDecision
        case progressing
        case done
        case circleCounts
    }
}


enum Positions: Int, CaseIterable, Equatable {
    case pos1
    case pos2
    case pos3
    case pos4
    case pos5
    case pos6
    case pos7
    case pos8
    case pos9
    case pos10
    case pos11
    case pos12
    case pos13
    case pos14
    case pos15
    case pos16
    case pos17
    case pos18
    case pos19
    case pos20
    case pos21
    case pos22
    case pos23
    case pos24
    case pos25
    case pos26
    case pos27
    case pos28
    case pos29
    case pos30
    case pos31
    case pos32
    case pos33
    case pos34
    case pos35
    case pos36
    case pos37
    case pos38
    case pos39
    case pos40
    case pos41
    case pos42
    case pos43
    case pos44
    case pos45
    case pos46
    case pos47
    case pos48
    case pos49
    case pos50
    case pos51
    case pos52
    case pos53
    case pos54
    case pos55
    case pos56
    case pos57
    case pos58
    case pos59
    case pos60
}
