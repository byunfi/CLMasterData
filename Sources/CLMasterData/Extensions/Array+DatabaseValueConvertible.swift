import Foundation
import GRDB

extension Array: DatabaseValueConvertible {
    
    public var databaseValue: DatabaseValue {
        let value = description.replacingOccurrences(of: " ", with: "")
        return DatabaseValue(value: value)!
    }
    
    public static func fromDatabaseValue(_ dbValue: DatabaseValue) -> Array<Element>? {
        guard case let .string(value) = dbValue.storage else {
            return nil
        }
        
        let resultElementType = Element.self
        if Int.self == resultElementType {
            return value[.start(1), .end(-1)]
                .split(separator: ",")
                .map { Int($0)! as! Element }
        }
        
        if String.self == resultElementType {
            return value[.start(1), .end(-1)]
                .split(separator: ",")
                .map { String($0) as! Element }
        }
        
        if [Int].self == resultElementType {
            return value.split(separator: "[").map {
                    $0[.start(0), .end(-2)]
                    .split(separator: ",")
                    .map { Int($0)! } as! Element }
        }
        
        if [String].self == resultElementType {
            return value.split(separator: "[").map {
                    $0[.start(0), .end(-2)]
                    .split(separator: ",")
                    .map { String($0) } as! Element }
        }
        fatalError("Does not support more than two-dimensional arrays")
    }
}


