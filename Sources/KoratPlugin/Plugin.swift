import Foundation
import AppKit

public protocol Plugin: NSObject {
    var name: String { get  }
    
    init(korat: Korat)
    func loadViewController() -> NSViewController
}
