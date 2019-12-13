//
//  MDOwnedSkill.swift
//  
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MDOwnedSkill {
    public let skillId: Int
    public let num: Int
    public let name: String
    public let iconId: Int
    public let chargeTurn: Int
    public let maxLv: Int
    public let effects: [MDEffect]
    public let strengthStatus: Int
    public let flag: Int
    public let condQuestId: Int
    public let condQuestName: String?
    public let condQuestPhase: Int
    public let condLv: Int
    public let condLimitCount: Int
}

extension MDOwnedSkill: FetchableRecord {
    public init(row: Row) {
        let row = row.unadapted
        skillId = row["skillId"]
        num = row["num"]
        name = row["name"]
        iconId = row["iconId"]
        chargeTurn = row["chargeTurn"]
        maxLv = row["maxLv"]
        let detail: [String] = row["detail"]
        let value: [[String]] = row["value"]
        effects = zip(detail, value).map(MDEffect.init)
        strengthStatus = row["strengthStatus"]
        flag = row["flag"]
        condQuestId = row["condQuestId"]
        condQuestName = row[11]
        condQuestPhase = row["condQuestPhase"]
        condLv = row["condLv"]
        condLimitCount = row["condLimitCount"]
    }
}
