// Generated using Sourcery 0.5.9 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length

fileprivate func combineHashes(_ hashes: [Int]) -> Int {
    return hashes.reduce(0, combineHashValues)
}

fileprivate func combineHashValues(_ initial: Int, _ other: Int) -> Int {
    #if arch(x86_64) || arch(arm64)
        let magic: UInt = 0x9e3779b97f4a7c15
    #elseif arch(i386) || arch(arm)
        let magic: UInt = 0x9e3779b9
    #endif
    var lhs = UInt(bitPattern: initial)
    let rhs = UInt(bitPattern: other)
    lhs ^= rhs &+ magic &+ (lhs << 6) &+ (lhs >> 2)
    return Int(bitPattern: lhs)
}

// MARK: - AutoHashable for classes, protocols, structs

// MARK: - AutoHashable for Enums

// MARK: - ApplicationLogLine AutoHashable
extension ApplicationLogLine: Hashable {
    internal var hashValue: Int {
        switch self {
        case .kaleidoscopeCommandMessage(let data): 
            return combineHashes([1, data.hashValue])
        case .referenceImageSavedMessage(let data): 
            return combineHashes([2, data.hashValue])
         case .unknown: 
            return 3.hashValue
        }
    }
}

// MARK: -