//
//  XorObfuscator.swift
//  ABObfuscatedAlerts
//
//  Created by Adil Bougamza on 11/09/2018.
//  Copyright © 2018 Adil BOUGAMZA. All rights reserved.
//

protocol Obfuscable {
    var salt: String { get }
    init(salt: String)
    func obfuscate(string: String) -> [UInt8]
    func deobfuscate(key: [UInt8]) -> String
}

import Foundation

class XorObfuscator: Obfuscable {
    var salt: String

    required init(salt: String) {
        self.salt = salt
    }

    func obfuscate(string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let byteSalt = [UInt8](self.salt.utf8)
        let length = byteSalt.count

        var encrypted = [UInt8]()

        for c in text.enumerated() {
            encrypted.append(c.element ^ byteSalt[c.offset % length])
        }

        return encrypted
    }

    func deobfuscate(key: [UInt8]) -> String {
        let byteSalt = [UInt8](self.salt.utf8)
        let length = byteSalt.count

        var decrypted = [UInt8]()

        for c in key.enumerated() {
            let index = c.offset % length
            decrypted.append(c.element ^ byteSalt[index])
        }

        return String(bytes: decrypted, encoding: .utf8)!
    }
}
