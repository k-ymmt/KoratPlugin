import Foundation
import AppKit

public protocol Plugin: NSObject {
    init(korat: Korat)
    func loadViewController() -> NSViewController
}
