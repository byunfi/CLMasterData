//
//  MstTreasureDeviceLv.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstTreasureDeviceLv {
    public let treaureDeviceId: Int
    public let lv: Int
    public let tdPoint: Int
    public let tdPointQ: Int
    public let tdPointA: Int
    public let tdPointB: Int
    public let tdPointEx: Int
    public let tdPointDef: Int
}

extension MstTreasureDeviceLv: TableRecord {
    public static var databaseTableName: String { "MstTreasureDeviceLv" }
}

extension MstTreasureDeviceLv: FetchableRecord {
    public init(row: Row) {
        treaureDeviceId = row["treaureDeviceId"]
        lv = row["lv"]
        tdPoint = row["tdPoint"]
        tdPointQ = row["tdPointQ"]
        tdPointA = row["tdPointA"]
        tdPointB = row["tdPointB"]
        tdPointEx = row["tdPointEx"]
        tdPointDef = row["tdPointDef"]
    }
}
