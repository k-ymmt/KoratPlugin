//
//  Korat.swift
//  KoratPlugin
//
//  Created by Kazuki Yamamoto on 2020/02/24.
//

import Foundation
import Combine

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
    func subscribeEvent(callback: @escaping (Result<DeviceEvent, Error>) -> Void) -> Cancellable
    func subscribeDeviceMessage(udid: String, id: String, callback: @escaping (Result<Data, Error>) -> Void) -> Cancellable
}

public protocol KoratApp {
    var mobileDeviceCenter: MobileDeviceCenter { get }
    
    func subscribeSelectedDeviceChanged(observer: @escaping (MobileDevice?) -> Void) -> Cancellable
    
    func selectDevice(_ device: MobileDevice?)
}
