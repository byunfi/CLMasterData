//
//  MstCombineLimit.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstCombineLimit {
    public let itemIds: [Int]
    public let itemNums: [Int]
    public let id: Int
    public let svtLimit: Int
    public let qp: Int
}

extension MstCombineLimit: TableRecord {
    public static var databaseTableName: String { "MstCombineLimit" }
}

extension MstCombineLimit: FetchableRecord {
    public init(row: Row) {
        itemIds = row["itemIds"]
        itemNums = row["itemNums"]
        id = row["id"]
        svtLimit = row["svtLimit"]
        qp = row["qp"]
    }
}
