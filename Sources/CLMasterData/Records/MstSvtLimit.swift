//
//  MstSvtLimit.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstSvtLimit {
    public let svtId: Int
    public let limitCount: Int
    public let rarity: Int
    public let lvMax: Int
    public let hpBase: Int
    public let hpMax: Int
    public let atkBase: Int
    public let atkMax: Int
    public let criticalWeight: Int
    public let power: Int
    public let defense: Int
    public let agility: Int
    public let magic: Int
    public let luck: Int
    public let treasureDevice: Int
    public let policy: Int
    public let personality: Int
    public let deity: Int
}

extension MstSvtLimit: TableRecord {
    public static var databaseTableName: String { "MstSvtLimit" }
}

extension MstSvtLimit: FetchableRecord {
    public init(row: Row) {
        svtId = row["svtId"]
        limitCount = row["limitCount"]
        rarity = row["rarity"]
        lvMax = row["lvMax"]
        hpBase = row["hpBase"]
        hpMax = row["hpMax"]
        atkBase = row["atkBase"]
        atkMax = row["atkMax"]
        criticalWeight = row["criticalWeight"]
        power = row["power"]
        defense = row["defense"]
        agility = row["agility"]
        magic = row["magic"]
        luck = row["luck"]
        treasureDevice = row["treasureDevice"]
        policy = row["policy"]
        personality = row["personality"]
        deity = row["deity"]
    }
}
