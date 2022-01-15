//
//  Example.swift
//  PathElements
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathElements/blob/master/LICENSE for license information.
//

import SwiftUI

public extension Shape {
  
  func elements<PathElement>(@ViewBuilder innerContent: @escaping (Int, CGPoint, Path.Element) -> PathElement) -> some View where PathElement : View {
    modifier(PathElements(shape: self, innerContent: innerContent))
  }
  
}

private struct PathContainer: Identifiable {
  let id: Int
  let lastPoint: CGPoint
  let element: Path.Element
}

public struct PathElements<S, NewContent>: ViewModifier, ShapeStyle where S: Shape, NewContent: View {
 
  private let path: Path
  private let innerContent: (Int, CGPoint, Path.Element) -> NewContent
  
  public init(shape: S, @ViewBuilder innerContent: @escaping (Int, CGPoint, Path.Element) -> NewContent) {
    
    self.path = shape.path(in: CGRect.unit)
    self.innerContent = innerContent
  }
  
  public func body(content: Content) -> some View {
      
    let elements = pathElements()
    
    ZStack {
      ForEach(elements) { item in
        innerContent(item.id, item.lastPoint, item.element)
      }
    }
  }
  
  private func pathElements() -> [PathContainer] {
    var elements: [PathContainer] = []
    var counter: Int = 0
    var lastPoint: CGPoint = .zero
    var firstPoint: CGPoint = .zero
    self.path.forEach { element in
      
      switch element {
      case .move(to: let to):
        lastPoint = to
        firstPoint = to
        elements.append(PathContainer(id: counter, lastPoint: lastPoint, element: element))
        counter += 1
      case .line(to: let to):
        elements.append(PathContainer(id: counter, lastPoint: lastPoint, element: element))
        counter += 1
        lastPoint = to
      case .quadCurve(to: let to, control: _):
        elements.append(PathContainer(id: counter, lastPoint: lastPoint, element: element))
        counter += 1
        lastPoint = to
      case .curve(to: let to, control1: _, control2: _):
        elements.append(PathContainer(id: counter, lastPoint: lastPoint, element: element))
        counter += 1
        lastPoint = to
      case .closeSubpath:
        elements.append(PathContainer(id: counter, lastPoint: lastPoint, element: Path.Element.line(to: firstPoint)))
        counter += 1
        lastPoint = firstPoint
      }
      
    }
    return elements
  }
}
