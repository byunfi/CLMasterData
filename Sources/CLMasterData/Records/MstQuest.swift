//
//  MstQuest.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstQuest: FetchableRecord {
    public let id: Int
    public let jpName: String
    public let type: Int
    public let consumeType: Int
    public let actConsume: Int
    public let spotId: Int
    public let giftId: Int
    public let priority: Int
    public let bannerType: Int
    public let bannerId: Int
    public let iconId: Int
    public let charaIconId: Int
    public let giftIconId: Int
    public let afterClear: Int
    public let chapterId: Int
    public let chapterSubId: Int
    public let chapterSubStr: String
    public let recommendLv: String
    public let flag: Int
    public let openedAt: Int
    public let closedAt: Int
    public let name: String
    
    public init(row: Row) {
        id = row["id"]
        jpName = row["jpName"]
        type = row["type"]
        consumeType = row["consumeType"]
        actConsume = row["actConsume"]
        spotId = row["spotId"]
        giftId = row["giftId"]
        priority = row["priority"]
        bannerType = row["bannerType"]
        bannerId = row["bannerId"]
        iconId = row["iconId"]
        charaIconId = row["charaIconId"]
        giftIconId = row["giftIconId"]
        afterClear = row["afterClear"]
        chapterId = row["chapterId"]
        chapterSubId = row["chapterSubId"]
        chapterSubStr = row["chapterSubStr"]
        recommendLv = row["recommendLv"]
        flag = row["flag"]
        openedAt = row["openedAt"]
        closedAt = row["closedAt"]
        name = row["name"]
    }
}

extension MstQuest: TableRecord {
    public static var databaseTableName: String { "MstQuest" }
    public static var databaseSelection: [SQLSelectable] = [Column("id"), Column("name") ?? Column("jpName")]
}

//extension MstQuest: FetchableRecord {
//    init(row: Row) {
//        id = row["id"]
//        jpName = row["jpName"]
//        type = row["type"]
//        consumeType = row["consumeType"]
//        actConsume = row["actConsume"]
//        spotId = row["spotId"]
//        giftId = row["giftId"]
//        priority = row["priority"]
//        bannerType = row["bannerType"]
//        bannerId = row["bannerId"]
//        iconId = row["iconId"]
//        charaIconId = row["charaIconId"]
//        giftIconId = row["giftIconId"]
//        afterClear = row["afterClear"]
//        chapterId = row["chapterId"]
//        chapterSubId = row["chapterSubId"]
//        chapterSubStr = row["chapterSubStr"]
//        recommendLv = row["recommendLv"]
//        flag = row["flag"]
//        openedAt = row["openedAt"]
//        closedAt = row["closedAt"]
//        name = row["name"]
//    }
//}
