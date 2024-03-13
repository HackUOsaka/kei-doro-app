
 import SwiftUI
 import FirebaseFirestore
 
 struct CallView: View {
     var body: some View {
         VStack {
             Group {
                 ChatBaloonShape(cornerRadius: 16, triangleSize: 8)
                     .stroke(.black)
                ChatBaloonShape(cornerRadius: 32, triangleSize:  16)
                     .fill(Color.red.opacity(0.3))
             }
             .frame(width: 200, height: 140)
         }
      }
 }
 
 struct ChatBaloonShape: Shape {
     private var cornerRadius: CGFloat
     private var triangleSize: CGFloat
      init(cornerRadius: CGFloat, triangleSize: CGFloat) {
         self.cornerRadius = cornerRadius
         self.triangleSize = triangleSize
     }
     public func path(in rect: CGRect) -> Path {
         Path { path in
             // 右上角丸
             path.addArc(
                 center: CGPoint(
                     x: rect.maxX - cornerRadius,
                     y: rect.minY + cornerRadius
                 ),
                 radius: cornerRadius,
                 startAngle: Angle(degrees: 270),
                 endAngle: Angle(degrees: 0),
                 clockwise: false
             )
             
             // 右下角丸
             path.addArc(
                 center: CGPoint(
                     x: rect.maxX - cornerRadius,
                     y: rect.maxY - cornerRadius
                 ),
                 radius: cornerRadius,
                 startAngle: Angle(degrees: 0),
                 endAngle: Angle(degrees: 90),
                 clockwise: false
             )
      
             // 左下角丸
             path.addArc(
                 center: CGPoint(
                     x: rect.minX + cornerRadius + triangleSize,
                     y: rect.maxY - cornerRadius
                 ),
                 radius: cornerRadius,
                 startAngle: Angle(degrees: 90),
                 endAngle: Angle(degrees: 180),
                 clockwise: false
             )
             
             // 左上三角（吹き出し）
            path.addLine(to: CGPoint(x: triangleSize, y:  triangleSize))
             path.addLine(to: .zero)
             path.closeSubpath()
         }
     }
}
 
 #Preview {
     CallView()
 }
