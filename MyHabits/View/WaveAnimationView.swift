//
//  WaveAnimationView.swift
//  MyHabits
//
//  Created by Lena on 2022/05/05.
//

import SwiftUI


// Wave
struct Wave: Shape {
    
    @EnvironmentObject var habitDataClass: HabitDataClass
    
    var offset: Angle
    var percent: Double

    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }

    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        let waveHeight = 0.015 * rect.height
        let yOffset = CGFloat(1 - percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        p.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))

        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yOffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }

        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()

        return p
    }
}



struct WaveView: View {

    @State private var percent = 50.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    @State var timerTest : Timer?
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Rectangle().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).ignoresSafeArea()
                
                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                    .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(.white)
                
                Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(percent)/100)
                    .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                    .opacity(0.5)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
            } //ZStack

            .onTapGesture {
                guard timerTest == nil else  { return }
                timerTest =  Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                    if percent <= 100 {
                        withAnimation(Animation.linear(duration: 0.03)) {
                            percent += 0.25
                        }
                    } else {
                        self.timerTest?.invalidate()
                        self.timerTest = nil
                    }
                }

            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                self.waveOffset2 = Angle(degrees: -180)
            }
        }
    }
}
