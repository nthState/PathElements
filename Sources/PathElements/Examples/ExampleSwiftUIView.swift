//
//  Example.swift
//  PathElements
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathElements/blob/main/LICENSE for license information.
//

import SwiftUI

struct ExampleSwiftUIView {}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    VStack(spacing: 24) {
      rectangle
      rectangleWithElements
      circleWithElements
    }
  }
  
  var rectangle: some View {
    Rectangle()
      .stroke(Color.red, lineWidth: 2)
      .frame(width: 100, height: 100)
  }
  
  var rectangleWithElements: some View {
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
  
  var circleWithElements: some View {
    Circle()
      .elements { index, lastPoint, element in

        if case let Path.Element.curve(to: point, control1: control1, control2: control2) = element {
          
          let scaledLast = lastPoint * CGSize(width: 100, height: 100)
          let scaledPoint = point * CGSize(width: 100, height: 100)
          let scaledControl1 = control1 * CGSize(width: 100, height: 100)
          let scaledControl2 = control2 * CGSize(width: 100, height: 100)
          
          Path { path in
            path.move(to: scaledLast)
            path.addCurve(to: scaledPoint, control1: scaledControl1, control2: scaledControl2)
          }
          .trimmedPath(from: 0.1, to: 0.9)
          .stroke(style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap.round))
          .foregroundColor(index % 2 == 0 ? Color.red : Color.green)
          .frame(width: 100, height: 100)
        }
        
      }
      .frame(width: 100, height: 100)
  }
  
}

#if DEBUG

struct ExampleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      ExampleSwiftUIView()
    }
}

#endif
