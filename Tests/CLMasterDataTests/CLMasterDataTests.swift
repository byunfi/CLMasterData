import XCTest
@testable import CLMasterData

private func getTestDatabasePath() -> String {
    let url = URL(string: "file://" + NSTemporaryDirectory() + "masterData.sqlite")!
    if !FileManager.default.fileExists(atPath: url.path) {
        let data = try! Data(contentsOf: URL(string: "https://raw.githubusercontent.com/byunfi/MasterDatabase/master/masterData.sqlite")!)
        try! data.write(to: url)
    }
    return url.path
}

final class CLMasterDataTests: XCTestCase {
    
    lazy var md: CLMasterData = {
        let path = getTestDatabasePath()
        return CLMasterData(databasePath: path)
    }()
    
    func testQuestName() {
        XCTAssertEqual(try! md.questName(id: 3000116), "异闻之带")
        XCTAssertEqual(try! md.questName(id: 94003222), "愉悦の宴 Rank C")
        XCTAssertNil(try! md.questName(id: 11111111))
    }
    
    func testTreasureDevices() {
        let tds = try! md.treasureDevices(svtId: 100800)
        XCTAssertEqual(tds.count, 2)
        let td1 = tds[0]
        let td2 = tds[1]
        XCTAssertEqual(td1.strengthStatus, 1)
        XCTAssertEqual(td2.strengthStatus, 2)
    }
    
    static var allTests = [
        ("testQuestName", testQuestName),
    ]
}
