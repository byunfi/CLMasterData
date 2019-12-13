//
//  MDTreasureDevice.swift
//  
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MDTreasureDevice {
    public let treasureDeviceId: Int
    public let cardId: Int
    public let damage: [Int]
    public let name: String
    public let maxLv: Int
    public let rank: String
    public let typeText: String
    public let effects: [MDEffect]
    public let strengthStatus: Int
    public let flag: Int
    public let condFriendshipRank: Int
    public let condQuestId: Int
    public let condQuestName: String?
    public let condQuestPhase: Int
    public let condLv: Int
}

extension MDTreasureDevice: FetchableRecord {
    public init(row: Row) {
        let row = row.unadapted
        treasureDeviceId = row["treasureDeviceId"]
        cardId = row["cardId"]
        damage = row["damage"]
        name = row["name"]
        rank = row["rank"]
        maxLv = row["maxLv"]
        typeText = row["typeText"]
        let detail: [String] = row["detail"]
        let value: [[String]] = row["value"]
        effects = zip(detail, value).map(MDEffect.init)
        strengthStatus = row["strengthStatus"]
        flag = row["flag"]
        condFriendshipRank = row["condFriendshipRank"]
        condQuestId = row["condQuestId"]
        condQuestName = row[13]
        condQuestPhase = row["condQuestPhase"]
        condLv = row["condLv"]
    }
}
