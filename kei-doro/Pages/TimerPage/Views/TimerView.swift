

import SwiftUI

struct TimerView: View {
    @State private var timeInterval: TimeInterval = 180
    @State var isShowAlert = false
    
    private let formatter = TimerFormatter()
    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(NSNumber(value: timeInterval), formatter: formatter)
            .font(.system(size: 40))
            .foregroundStyle(.white)
            .onReceive(timer) { _ in
                timeInterval -= 0.01
                timeInterval = max(self.timeInterval, 0.0)
            }
            .padding()
    }
}

#Preview{
    TimerView()
}
