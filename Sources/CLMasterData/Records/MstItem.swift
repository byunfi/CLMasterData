//
//  MstItem.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstItem {
    public let script: String
    public let eventId: Int
    public let eventGroupId: Int
    public let id: Int
    public let jpName: String
    public let detail: String
    public let imageId: Int
    public let type: Int
    public let dropPriority: Int
    public let name: String
}

extension MstItem: TableRecord {
    public static var databaseTableName: String { "MstItem" }
    public static var databaseSelection: [SQLSelectable] = [Column("id"), Column("name") ?? Column("jpName")]
}

extension MstItem: FetchableRecord {
    public init(row: Row) {
        script = row["script"]
        eventId = row["eventId"]
        eventGroupId = row["eventGroupId"]
        id = row["id"]
        jpName = row["jpName"]
        detail = row["detail"]
        imageId = row["imageId"]
        type = row["type"]
        dropPriority = row["dropPriority"]
        name = row["name"]
    }
}
