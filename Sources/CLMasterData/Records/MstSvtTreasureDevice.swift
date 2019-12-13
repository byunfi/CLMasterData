//
//  MstSvtTreasureDevice.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstSvtTreasureDevice {
    public let damage: [Int]
    public let strengthStatus: Int
    public let svtId: Int
    public let num: Int
    public let priority: Int
    public let flag: Int
    public let treasureDeviceId: Int
    public let condQuestId: Int
    public let condQuestPhase: Int
    public let condLv: Int
    public let condFriendshipRank: Int
    public let cardId: Int
}

extension MstSvtTreasureDevice: TableRecord {
    public static var databaseTableName: String { "MstSvtTreasureDevice" }
    
    public static let treasureDevice = hasOne(MstTreasureDevice.self)
    public static let quest = hasOne(MstQuest.self, key: "quest", using: ForeignKey(["id"], to: ["condQuestId"]))
}

extension MstSvtTreasureDevice: FetchableRecord {
    public init(row: Row) {
        damage = row["damage"]
        strengthStatus = row["strengthStatus"]
        svtId = row["svtId"]
        num = row["num"]
        priority = row["priority"]
        flag = row["flag"]
        treasureDeviceId = row["treasureDeviceId"]
        condQuestId = row["condQuestId"]
        condQuestPhase = row["condQuestPhase"]
        condLv = row["condLv"]
        condFriendshipRank = row["condFriendshipRank"]
        cardId = row["cardId"]
    }
}
