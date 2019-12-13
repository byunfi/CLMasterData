//
//  MDServant.swift
//  
//
//  Created by byunfi on 2019/12/13.
//

import Foundation

public struct MDServant {
    public let id: Int
    public let collectionNo: Int
    public let name: String?
    public let jpName: String
    public let classId: Int
    public let rarity: Int
    
    public let treasureDevices: [MDTreasureDevice]
    public let ownedSkills: [MDOwnedSkill]
    public let clasSkills: [MDClassSkill]
}
