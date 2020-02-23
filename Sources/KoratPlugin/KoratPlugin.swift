import Foundation
import AppKit

public protocol KoratPlugin: NSObject {
    init(korat: Korat)
    func loadViewController() -> NSViewController
}
