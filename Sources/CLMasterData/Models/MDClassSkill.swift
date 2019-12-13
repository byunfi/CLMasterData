//
//  MDClassSkill.swift
//  
//
//  Created by byunfi on 2019/12/13.
//

import Foundation
import GRDB

public struct MDClassSkill {
    public let skillId: Int
    public let name: String
    public let iconId: Int
    public let effects: [MDEffect]
}

extension MDClassSkill: FetchableRecord {
    public init(row: Row) {
        let row = row.unadapted
        skillId = row["id"]
        name = row["name"]
        iconId = row["iconId"]
        let detail: [String] = row["detail"]
        let value: [String] = row["value"]
        effects = zip(detail, value).map { MDEffect(description: $0.0, levelValues: [$0.1]) }
    }
}
