import Foundation
import AppKit

public protocol Plugin: NSObject {
    var name: String { get }
    
    init(korat: KoratApp)
    func loadViewController() -> NSViewController
}
