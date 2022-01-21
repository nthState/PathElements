//
//  PathElementsTests.swift
//  PathElements
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathElements/blob/master/LICENSE for license information.
//


import XCTest
import SwiftUI
@testable import PathElements

final class PathElementsTests: XCTestCase {
  
  func test_rectangle_elements_match() throws {
    
    let shape = Rectangle()
    
    let p = PathElements(shape: shape) { index, point, element in
      
    }
    
    let elements = p.pathElements()
    
    XCTAssertEqual(5, elements.count, "Elements should match")
  }
  
  func test_pathElements_closure_called() throws {
    
    let shape = Rectangle()
    
    let expectation = XCTestExpectation(description: "")
    
    let p = PathElements(shape: shape) { index, point, element in
        let _ = expectation.fulfill()
    }
    
    let _ = p.innerContent(1, .zero, .move(to: .zero))
    
    wait(for: [expectation], timeout: 1)
  }
  
}
