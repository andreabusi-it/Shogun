import XCTest
@testable import Shogun

final class UIColorTests: XCTestCase {
    
    func testInitHex3() throws {
        let color = UIColor(hex3: 0xA3C)
        let hex = color.hexString()
        XCTAssertEqual(hex, "#AA33CC")
    }
    
    func testInitHex4() throws {
        let color = UIColor(hex4: 0xA3C4)
        let hex = color.hexString(includeAlpha: true)
        XCTAssertEqual(hex, "#AA33CC44")
    }
    
    func testInitHex6() throws {
        let color = UIColor(hex6: 0xA237C2)
        let hex = color.hexString()
        XCTAssertEqual(hex, "#A237C2")
    }
    
    func testInitHex8() throws {
        let color = UIColor(hex8: 0xA237C2A2)
        let hex = color.hexString(includeAlpha: true)
        XCTAssertEqual(hex, "#A237C2A2")
    }
    
    func testInitStringHex3() throws {
        let color = UIColor(hexString: "#A3C")
        let hex = color?.hexString()
        XCTAssertEqual(hex, "#AA33CC")
    }
    
    func testInitStringHex4() throws {
        let color = UIColor(hexString: "#A3C4")
        let hex = color?.hexString(includeAlpha: true)
        XCTAssertEqual(hex, "#AA33CC44")
    }
    
    func testInitStringHex6() throws {
        let color = UIColor(hexString: "#A237C2")
        let hex = color?.hexString()
        XCTAssertEqual(hex, "#A237C2")
    }
    
    func testInitStringHex8() throws {
        let color = UIColor(hexString: "#A237C2A2")
        let hex = color?.hexString(includeAlpha: true)
        XCTAssertEqual(hex, "#A237C2A2")
    }
}
