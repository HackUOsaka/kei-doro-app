
 import SwiftUI
 import Combine

 struct TimerView: View {
     var body: some View {
         CircleProgressView()
     }
 }

 struct CircleProgressView: View {
     @StateObject var viewModel = CircleProgressViewModel()
     var body: some View {
         ZStack {
             Circle()
                 .stroke(
                     Color.secondColor,
                     style: StrokeStyle(
                         lineWidth: 15,
                         lineCap: .round)
                 )
                 .opacity(0.5)
                 .frame(width: 300, height: 300)
             Circle()
                 .trim(from: 0.0, to: viewModel.progressValue) // toの値をViewModelのprogressValueを参照する
                 .stroke(
                     Color.mainColor,
                     style: StrokeStyle(
                         lineWidth: 15,
                         lineCap: .round)
                 )
                 .frame(width: 300, height: 300)
                 .rotationEffect(Angle(degrees: -90))
         }
     }
 }

 #Preview {
     TimerView()
 }
