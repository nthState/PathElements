import SwiftUI

extension ExampleSwiftUIView: View {
  
  var body: some View {
    Rectangle()
      .elements { index, lastPoint, element in
        
        if case let Path.Element.line(to: point) = element {
          
          let scaledLast = lastPoint * CGSize(width: 100, height: 100)
          let scaledPoint = point * CGSize(width: 100, height: 100)
          
          Path { path in
            path.move(to: scaledLast)
            path.addLine(to: scaledPoint)
          }
          .trimmedPath(from: 0.4, to: 0.6)
          .stroke(style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap.round))
          .foregroundColor(index % 2 == 0 ? Color.red : Color.green)
          .frame(width: 100, height: 100)
        }
        
      }
      .frame(width: 100, height: 100)
  }
}
