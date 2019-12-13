import Foundation

extension StringProtocol {
    subscript(range: StringIndex...) -> Self.SubSequence {
        if case let .start(so) = range[0], case let .end(eo) = range[1] {
            let start = intToIndex(so)
            let end = intToIndex(eo)
            return self[start..<end]
        }
        fatalError("Unexpceted String Index")
    }
    
    private func intToIndex(_ i: Int) -> Index {
        let res = index(i >= 0 ? startIndex: endIndex, offsetBy: i)
        return res
    }
}

enum StringIndex {
    case start(_ offset: Int)
    case end(_ offset: Int)
}
