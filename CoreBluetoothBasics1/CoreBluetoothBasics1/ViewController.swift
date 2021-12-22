//
//  ViewController.swift
//  CoreBluetoothBasics1
//
//  Created by Mauro Arantes on 22/12/2021.
//

import UIKit
import CoreBluetooth

class BluetoothViewController: UIViewController {
    private var centralManager: CBCentralManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    var discoveredPeripherals = [CBPeripheral]()
    func startScan() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    var connectedPeripheral: CBPeripheral?
    func connect(peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
     }
    
    func disconnect(peripheral: CBPeripheral) {
        centralManager.cancelPeripheralConnection(peripheral)
    }
    
    // Call after connecting to peripheral
    func discoverServices(peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
     
    // Call after discovering services
    func discoverCharacteristics(peripheral: CBPeripheral) {
        guard let services = peripheral.services else {
            return
        }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func discoverDescriptors(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
        peripheral.discoverDescriptors(for: characteristic)
    }
    
    func subscribeToNotifications(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
        peripheral.setNotifyValue(true, for: characteristic)
     }
    
    func readValue(characteristic: CBCharacteristic) {
        self.connectedPeripheral?.readValue(for: characteristic)
    }
    
//    func write(value: Data, characteristic: CBCharacteristic) {
//        self.connectedPeripheral?.writeValue(value, for: characteristic, type: .withResponse)
//        // OR
//       self.connectedPeripheral?.writeValue(value, for: characteristic, type: .withoutResponse)
//     }
    
    func write(value: Data, characteristic: CBCharacteristic) {
        if let _ = connectedPeripheral?.canSendWriteWithoutResponse {
            self.connectedPeripheral?.writeValue(value, for: characteristic, type: .withoutResponse)
        }
    }
    
}

extension BluetoothViewController: CBCentralManagerDelegate {
 
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
            case .poweredOn:
                startScan()
            case .poweredOff:
                print("off")
                // Alert user to turn on Bluetooth
            case .resetting:
            print("reset")
                // Wait for next state update and consider logging interruption of Bluetooth service
            case .unauthorized:
            print("unauthorized")
                // Alert user to enable Bluetooth permission in app Settings
            case .unsupported:
            print("unsupported")
                // Alert user their device does not support Bluetooth and app will not work as expected
            case .unknown:
            print("unknown")
               // Wait for next state update
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        self.discoveredPeripherals.append(peripheral)
    }
    
//    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
//        self.connectedPeripheral = peripheral
//        peripheral.delegate = self
//    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Successfully connected. Store reference to peripheral if not already done.
        self.connectedPeripheral = peripheral
    }
     
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        // Handle error
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if let error = error {
            // Handle error
            return
        }
        // Successfully disconnected
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {
            return
        }
        discoverCharacteristics(peripheral: peripheral)
    }
     
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else {
            return
        }
        // Consider storing important characteristics internally for easy access and equivalency checks later.
        // From here, can read/write to characteristics or subscribe to notifications as desired.
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        guard let descriptors = characteristic.descriptors else { return }
     
        // Get user description descriptor
        if let userDescriptionDescriptor = descriptors.first(where: {
            return $0.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString
        }) {
            // Read user description for characteristic
            peripheral.readValue(for: userDescriptionDescriptor)
        }
    }
     
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        // Get and print user description for a given characteristic
        if descriptor.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString,
            let userDescription = descriptor.value as? String {
            print("Characterstic \(descriptor.characteristic?.uuid.uuidString) is also known as \(userDescription)")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            // Handle error
            return
        }
        // Successfully subscribed to or unsubscribed from notifications/indications on a characteristic
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            // Handle error
            return
        }
        guard let value = characteristic.value else {
            return
        }
        // Do something with data
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            // Handle error
            return
        }
        // Successfully wrote value to characteristic
    }
    
//    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
//        // Called when peripheral is ready to send write without response again.
//        // Write some value to some target characteristic.
//        write(value: someValue, characteristic: someCharacteristic)
//    }
    
}
