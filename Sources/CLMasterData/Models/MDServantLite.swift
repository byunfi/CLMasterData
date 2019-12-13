//
//  MDServantLite.swift
//  
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MDServantLite {
    public let id: Int
    public let collectionNo: Int
    public let name: String?
    public let jpName: String
    public let classId: Int
    public let rarity: Int
}

extension MDServantLite: FetchableRecord {
    public init(row: Row) {
        id = row["id"]
        collectionNo = row["collectionNo"]
        name = row["name"]
        jpName = row["jpName"]
        classId = row["classId"]
        rarity = row["rarity"]
    }
}
