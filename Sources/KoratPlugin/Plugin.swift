import Foundation
import AppKit

public protocol Plugin: NSObject {
    var name: String { get }
    
    init(korat: KoratAppProtocol)
    func loadViewController() -> NSViewController
}
