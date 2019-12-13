//
//  MstTreasureDeviceDetail.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstTreasureDeviceDetail {
    public let id: Int
    public let detail: [String]
    public let value: [[String]]
}

extension MstTreasureDeviceDetail: TableRecord {
    public static var databaseTableName: String { "MstTreasureDeviceDetail" }
}

extension MstTreasureDeviceDetail: FetchableRecord {
    public init(row: Row) {
        id = row["id"]
        detail = row["detail"]
        value = row["value"]
    }
}
