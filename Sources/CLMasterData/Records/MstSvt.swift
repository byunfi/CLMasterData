//
//  MstSvt.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MstSvt {
    public let relateQuestIds: String
    public let individuality: String
    public let classPassive: String
    public let cardIds: String
    public let script: String
    public let id: Int
    public let baseSvtId: Int
    public let jpName: String
    public let ruby: String
    public let battleName: String
    public let classId: Int
    public let type: Int
    public let limitMax: Int
    public let rewardLv: Int
    public let friendshipId: Int
    public let maxFriendshipRank: Int
    public let genderType: Int
    public let attri: Int
    public let combineSkillId: Int
    public let combineLimitId: Int
    public let sellQp: Int
    public let sellMana: Int
    public let sellRarePri: Int
    public let expType: Int
    public let combineMaterialId: Int
    public let cost: Int
    public let battleSize: Int
    public let starRate: Int
    public let deathRate: Int
    public let attackAttri: Int
    public let illustratorId: Int
    public let cvId: Int
    public let collectionNo: Int
    public let materialStoryPriority: Int
    public let flag: Int
    public let name: String?
}

extension MstSvt {
    public static var servants: QueryInterfaceRequest<MstSvt> {
        let id = Column("id")
        return filter(id>100000 && id<9000000 && Column("collectionNo")>0)
    }
    
    public static var crafts: QueryInterfaceRequest<MstSvt> {
       return filter(Column("type")==6 && Column("collectionNo")>0)
   }
    
    public static var exps: QueryInterfaceRequest<MstSvt> {
        return filter(Column("type")==3)
    }
}

extension MstSvt: TableRecord {
    public static var databaseTableName: String { "MstSvt" }
    public static var databaseSelection: [SQLSelectable] = [Column("id"), Column("collectionNo"), Column("name"), Column("jpName"), Column("classId")]
    
    public static let svtLimit = hasOne(MstSvtLimit.self)
}

extension MstSvt: FetchableRecord {
    public init(row: Row) {
        relateQuestIds = row["relateQuestIds"]
        individuality = row["individuality"]
        classPassive = row["classPassive"]
        cardIds = row["cardIds"]
        script = row["script"]
        id = row["id"]
        baseSvtId = row["baseSvtId"]
        jpName = row["jpName"]
        ruby = row["ruby"]
        battleName = row["battleName"]
        classId = row["classId"]
        type = row["type"]
        limitMax = row["limitMax"]
        rewardLv = row["rewardLv"]
        friendshipId = row["friendshipId"]
        maxFriendshipRank = row["maxFriendshipRank"]
        genderType = row["genderType"]
        attri = row["attri"]
        combineSkillId = row["combineSkillId"]
        combineLimitId = row["combineLimitId"]
        sellQp = row["sellQp"]
        sellMana = row["sellMana"]
        sellRarePri = row["sellRarePri"]
        expType = row["expType"]
        combineMaterialId = row["combineMaterialId"]
        cost = row["cost"]
        battleSize = row["battleSize"]
        starRate = row["starRate"]
        deathRate = row["deathRate"]
        attackAttri = row["attackAttri"]
        illustratorId = row["illustratorId"]
        cvId = row["cvId"]
        collectionNo = row["collectionNo"]
        materialStoryPriority = row["materialStoryPriority"]
        flag = row["flag"]
        name = row["name"]
    }
}
