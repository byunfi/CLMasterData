//
//  MstCombineSkill.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstCombineSkill {
    public let itemIds: [Int]
    public let itemNums: [Int]
    public let id: Int
    public let skillLv: Int
    public let qp: Int
}

extension MstCombineSkill: TableRecord {
    public static var databaseTableName: String { "MstCombineSkill" }
}

extension MstCombineSkill: FetchableRecord {
    public init(row: Row) {
        itemIds = row["itemIds"]
        itemNums = row["itemNums"]
        id = row["id"]
        skillLv = row["skillLv"]
        qp = row["qp"]
    }
}
