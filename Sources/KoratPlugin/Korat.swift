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

public struct MobileDevice {
    public let name: String?
    public let udid: String
    
    public init(name: String?, udid: String) {
        self.name = name
        self.udid = udid
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
    
    public let device: MobileDevice
    public let type: EventType
    public let connectionType: ConnectionType
    
    public init(device: MobileDevice, type: EventType, connectionType: ConnectionType) {
        self.device = device
        self.type = type
        self.connectionType = connectionType
    }
}

public protocol MobileDeviceCenter {
    func subscribeEvent(callback: @escaping (Result<DeviceEvent, Error>) -> Void) -> Disposable
    func subscribeDeviceMessage(udid: String, id: String, callback: @escaping (Result<Data, Error>) -> Void) -> Disposable
}

public class Korat {
    public let mobileDeviceCenter: MobileDeviceCenter
    
    public init(mobileDeviceCenter: MobileDeviceCenter) {
        self.mobileDeviceCenter = mobileDeviceCenter
    }
}
