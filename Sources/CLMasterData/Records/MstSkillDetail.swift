//
//  MstSkillDetail.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstSkillDetail {
    public let id: Int
    public let detail: [String]
    public let value: [[String]]
}

extension MstSkillDetail: TableRecord {
    public static var databaseTableName: String { "MstSkillDetail" }
}

extension MstSkillDetail: FetchableRecord {
    public init(row: Row) {
        id = row["id"]
        detail = row["detail"]
        value = row["value"]
    }
}
