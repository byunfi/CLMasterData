//
//  MstTreasureDevice.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstTreasureDevice {
    public let script: String
    public let id: Int
    public let jpName: String
    public let ruby: String
    public let rank: String
    public let maxLv: Int
    public let typeText: String
    public let name: String
}

extension MstTreasureDevice: TableRecord {
    public static var databaseTableName: String { "MstTreasureDevice" }
    public static var databaseSelection: [SQLSelectable] = [Column("jpName"), Column("rank"), Column("maxLv"), Column("typeText"), Column("name")]
    
    public static let detail = hasOne(MstTreasureDeviceDetail.self)
    public static let lv = hasOne(MstTreasureDeviceLv.self)
}

extension MstTreasureDevice: FetchableRecord {
    public init(row: Row) {
        script = row["script"]
        id = row["id"]
        jpName = row["jpName"]
        ruby = row["ruby"]
        rank = row["rank"]
        maxLv = row["maxLv"]
        typeText = row["typeText"]
        name = row["name"]
    }
}
