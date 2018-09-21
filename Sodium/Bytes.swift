import Foundation
import Clibsodium

public typealias Bytes = Array<UInt8>

extension Array where Element == UInt8 {
    init (count bytes: Int) {
        self.init(repeating: 0, count: bytes)
    }

    public var utf8String: String? {
        return String(data: Data(bytes: self), encoding: .utf8)
    }
    
    public var sha256: Bytes {
        var result = Bytes(count: 32)
        crypto_hash_sha256(&result, self, UInt64(self.count))
        return result
    }
}

extension ArraySlice where Element == UInt8 {
    var bytes: Bytes { return Bytes(self) }
}

public extension String {
    var bytes: Bytes { return Bytes(self.utf8) }
}
