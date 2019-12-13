//
//  CLMasterData.swift
//
//
//  Created by byunfi on 2019/12/13.
//

import GRDB
import UIKit

open class CLMasterData {
    fileprivate let dbQueue: DatabaseQueue
    
    convenience public init(databaseDirectoryURL: URL, fileName: String) {
        let databaseURL = databaseDirectoryURL.appendingPathComponent(fileName)
        self.init(databasePath: databaseURL.path)
    }
    
    public init(databasePath: String) {
        var config = Configuration()
        config.foreignKeysEnabled = true
        config.readonly = true
        #if DEBUG
        config.trace = { debugPrint($0) }
        #endif
        
        dbQueue = try! DatabaseQueue(path: databasePath, configuration: config)
    }
}

extension CLMasterData {
    
    public func questName(id: Int) throws -> String? {
        return try dbQueue.read { db in
            let request = MstQuest.select(Column("name") ?? Column("jpName")).filter(Column("id")==id)
            return try String.fetchOne(db, request)
        }
    }
    
    public func treasureDevices(svtId: Int) throws -> [MDTreasureDevice] {
        return try dbQueue.read { db in
            let request = MDTreasureDevice.filter(svtId: svtId)
            return try request.fetchAll(db)
        }
    }
    
    public func ownedSkills(svtId: Int) throws -> [MDOwnedSkill] {
        return try dbQueue.read { db in
            let request = MDOwnedSkill.filter(svtId: svtId)
            return try request.fetchAll(db)
        }
    }
    
    public func classSkills(svtId: Int) throws -> [MDClassSkill] {
        return try dbQueue.read { db in
            return try fetchClassSkills(db, svtId: svtId)
        }
    }
    
    private func fetchClassSkills(_ db: Database, svtId: Int) throws -> [MDClassSkill] {
        let classPassiveRequest = MstSvt.select(Column("classPassive"), as: [Int].self)
            .filter(Column("id")==svtId)
        let classPassives = try classPassiveRequest.fetchOne(db)!
        return try MDClassSkill.filter(skillIds: classPassives).fetchAll(db)
    }
    
    public func servant(svtId: Int) throws -> MDServant {
        try dbQueue.read { db in
            let info = try MDServantLite.filter(svtId: svtId).fetchOne(db)!
            let treasureDevices = try MDTreasureDevice.filter(svtId: svtId).fetchAll(db)
            let ownedSkills = try MDOwnedSkill.filter(svtId: svtId).fetchAll(db)
            let classSkills = try fetchClassSkills(db, svtId: svtId)
            return MDServant(id: info.id, collectionNo: info.collectionNo, name: info.name, jpName: info.jpName, classId: info.classId, rarity: info.rarity, treasureDevices: treasureDevices, ownedSkills: ownedSkills, clasSkills: classSkills)
        }
    }
}

protocol AllRequest {
    static var fetchRequest: QueryInterfaceRequest<Self> { get }
}

extension MDTreasureDevice {
    static public func filter(svtId: Int) -> QueryInterfaceRequest<Self> {
        let treasureDeviceRequest = MstSvtTreasureDevice.treasureDevice
            .including(required: MstTreasureDevice.detail)
        let request = MstSvtTreasureDevice
            .including(optional: MstSvtTreasureDevice.quest)
            .including(required: treasureDeviceRequest)
            .filter(Column("svtId")==svtId && Column("num") < 90)
            .order(Column("strengthStatus"), Column("flag"))
        return request.asRequest(of: Self.self)
    }
}

extension MDOwnedSkill {
    static public func filter(svtId: Int) -> QueryInterfaceRequest<Self> {
        let skillRequest = MstSvtSkill.skill
            .including(required: MstSkill.detail)
            .including(required: MstSkill.lv.filter(Column("lv")==1))
        let request = MstSvtSkill
            .including(optional: MstSvtSkill.quest)
            .including(required: skillRequest)
            .filter(Column("svtId")==svtId)
            .order(Column("num"), Column("strengthStatus"), Column("flag"))
        return request.asRequest(of: Self.self)
    }
}

extension MDClassSkill {
    static public func filter(skillIds: [Int]) -> QueryInterfaceRequest<Self> {
        let request = MstSkill.filter(keys: skillIds)
            .select(Column("id"), Column("name"), Column("iconId"))
            .including(required: MstSkill.detail)
        return request.asRequest(of: Self.self)
    }
}

extension MDServantLite {
    static public func filter(svtId: Int) -> QueryInterfaceRequest<Self> {
        let limitRequest = MstSvt.svtLimit.select(Column("rarity"))
            .filter(Column("limitCount")==0)
        let request = MstSvt.servants.including(optional: limitRequest)
            .order(Column("collectionNo"))
        return request.asRequest(of: Self.self)
    }
}
