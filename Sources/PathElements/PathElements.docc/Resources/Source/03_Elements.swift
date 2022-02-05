import SwiftUI
import PathElements

extension ExampleSwiftUIView: View {
  
  var body: some View {
    Rectangle()
      .elements { index, lastPoint, element in
        
        if case let Path.Element.line(to: point) = element {
          
          
        }
        
      }
      .frame(width: 100, height: 100)
  }
}
