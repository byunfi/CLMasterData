//
//  MstSkill.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstSkill {
    public let id: Int
    public let type: Int
    public let jpName: String
    public let maxLv: Int
    public let iconId: Int
    public let name: String
}

extension MstSkill: TableRecord {
    public static var databaseTableName: String { "MstSkill" }
    
    public static let detail = hasOne(MstSkillDetail.self)
    public static let lv = hasOne(MstSkillLv.self)
}

extension MstSkill: FetchableRecord {
    public init(row: Row) {
        id = row["id"]
        type = row["type"]
        jpName = row["jpName"]
        maxLv = row["maxLv"]
        iconId = row["iconId"]
        name = row["name"]
    }
}
