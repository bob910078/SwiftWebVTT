import XCTest
@testable import SwiftWebVTT

class SwiftWebVTTTests: XCTestCase {

    override func setUp() { }
    override func tearDown() { }
    
    // MARK: - Test Cases
    
    func testExample() throws {
        
        let fileContents = """
        WEBVTT

        1
        00:01.000 --> 00:04.000
        Never drink liquid nitrogen.
        """
        
        let parser = WebVTTParser(string: fileContents)
        let webVTT = try? parser.parse()
        XCTAssertNotNil(webVTT)
        XCTAssertEqual(webVTT?.cues.count, 1)
    }
    
    func testAdvanced() throws {
        
        let fileContents = """
        WEBVTT
        
        00:11.000 --> 00:13.000
        <v Roger Bingham>We are in New York City

        00:13.000 --> 00:16.000
        <v Roger Bingham>We’re actually at the Lucern Hotel, just down the street

        00:16.000 --> 00:18.000
        <v Roger Bingham>from the American Museum of Natural History

        00:18.000 --> 00:20.000
        <v Roger Bingham>And with me is Neil deGrasse Tyson

        00:20.000 --> 00:22.000
        <v Roger Bingham>Astrophysicist, Director of the Hayden Planetarium

        00:22.000 --> 00:24.000
        <v Roger Bingham>at the AMNH.

        00:24.000 --> 00:26.000
        <v Roger Bingham>Thank you for walking down here.

        00:27.000 --> 00:30.000
        <v Roger Bingham>And I want to do a follow-up on the last conversation we did.

        00:30.000 --> 00:31.500 align:right size:50%
        <v Roger Bingham>When we e-mailed—

        00:30.500 --> 00:32.500 align:left size:50%
        <v Neil deGrasse Tyson>Didn’t we talk about enough in that conversation?

        00:32.000 --> 00:35.500 align:right size:50%
        <v Roger Bingham>No! No no no no; 'cos 'cos obviously 'cos

        00:32.500 --> 00:33.500 align:left size:50%
        <v Neil deGrasse Tyson><i>Laughs</i>

        00:35.500 --> 00:38.000
        <v Roger Bingham>You know I’m so excited my glasses are falling off here.
        """
        
        let parser = WebVTTParser(string: fileContents)
        let webVTT = try? parser.parse()
        XCTAssertNotNil(webVTT)
        XCTAssertEqual(webVTT?.cues.count, 13)
    }
    
//    func testEntitiesResolution() {
//        let encodedURL = url(forResource: "entities_encoded", withExtension: "txt")
//        var encoded = try! String(contentsOf: encodedURL)
//        encoded = encoded.decodingHTMLEntities()
//
//        let decodedURL = url(forResource: "entities_decoded", withExtension: "txt")
//        let decoded = try! String(contentsOf: decodedURL)
//
//        XCTAssert(encoded == decoded, "Can't correctly decode HTML entities.")
//    }
    
    // Sample WebVTT files not included
//    func testPerformance() {
//        self.measure {
//            load(name: "large")
//        }
//    }
//
//    @discardableResult
//    func load(name: String) -> WebVTT {
//        let fileURL = url(forResource: name, withExtension: "vtt")
//        let fileContents = try! String(contentsOf: fileURL)
//        let webVTT = try! WebVTTParser(string: fileContents).parse()
//        return webVTT
//    }
    
    // MARK: - Convenience
    
    func url(forResource name: String, withExtension ext: String?) -> URL {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: name, withExtension: ext)
        XCTAssertNotNil(url, "Resource \(name + (ext != nil ? ".\(ext!)" : "")) not found.")
        return url!
    }

}
