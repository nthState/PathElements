import SwiftUI
import PathElements

extension ExampleSwiftUIView: View {
  
  var body: some View {
    Rectangle()
      .elements { index, lastPoint, element in
        
      }
      .frame(width: 100, height: 100)
  }
}
