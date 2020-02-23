//
//  Korat.swift
//  KoratPlugin
//
//  Created by Kazuki Yamamoto on 2020/02/24.
//

import Foundation

public protocol Disposable {
    func dispose()
}

public extension Disposable {
    func callAsFunction() {
        dispose()
    }
}

public struct DeviceEvent {
    public enum EventType {
        case add
        case remove
        case paired
    }
    public enum ConnectionType {
        case usbmuxd
        case network
    }
}

public protocol MobileDeviceCenter {
    func subscribeEvent(callback: @escaping (DeviceEvent) -> Void) -> Disposable
    func subscribeDeviceMessage(uuid: String, id: String, callback: @escaping (Result<Data, Error>) -> Void) -> Disposable
}

public class Korat {
    public let mobileDeviceCenter: MobileDeviceCenter
    
    public init(mobileDeviceCenter: MobileDeviceCenter) {
        self.mobileDeviceCenter = mobileDeviceCenter
    }
}
