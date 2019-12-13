//
//  MstSvtSkill.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstSvtSkill {
    public let strengthStatus: Int
    public let svtId: Int
    public let num: Int
    public let skillId: Int
    public let condQuestId: Int
    public let condQuestPhase: Int
    public let condLv: Int
    public let condLimitCount: Int
    public let eventId: Int
    public let flag: Int
}

extension MstSvtSkill: TableRecord {
    public static var databaseTableName: String { "MstSvtSkill" }
    
    public static let skill = hasOne(MstSkill.self)
    public static let quest = hasOne(MstQuest.self, key: "quest", using: ForeignKey(["id"], to: ["condQuestId"]))
}

extension MstSvtSkill: FetchableRecord {
    public init(row: Row) {
        strengthStatus = row["strengthStatus"]
        svtId = row["svtId"]
        num = row["num"]
        skillId = row["skillId"]
        condQuestId = row["condQuestId"]
        condQuestPhase = row["condQuestPhase"]
        condLv = row["condLv"]
        condLimitCount = row["condLimitCount"]
        eventId = row["eventId"]
        flag = row["flag"]
    }
}
