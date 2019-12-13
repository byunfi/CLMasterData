//
//  MstSkillLv.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstSkillLv {
    public let funcId: String
    public let svals: String
    public let script: String
    public let skillId: Int
    public let lv: Int
    public let chargeTurn: Int
    public let skillDetailId: Int
}

extension MstSkillLv: TableRecord {
    public static var databaseTableName: String { "MstSkillLv" }
    public static var databaseSelection: [SQLSelectable] = [Column("chargeTurn")]
}

extension MstSkillLv: FetchableRecord {
    public init(row: Row) {
        funcId = row["funcId"]
        svals = row["svals"]
        script = row["script"]
        skillId = row["skillId"]
        lv = row["lv"]
        chargeTurn = row["chargeTurn"]
        skillDetailId = row["skillDetailId"]
    }
}
