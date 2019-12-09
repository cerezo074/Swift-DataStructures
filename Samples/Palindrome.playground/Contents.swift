import XCTest
import Foundation

class PalindromeTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testShortestWordWhenIsPalindrome() {
        let word = "HH"
        XCTAssertTrue(word.isPalindrome)
    }
    
    func testShortestWordWhenIsNotPalindrome() {
        let word = "Ho"
        XCTAssertFalse(word.isPalindrome)
    }
    
    func testPhraseWhenIsPalidrome() {
        let word = "amad a dama"
        XCTAssertTrue(word.isPalindrome)
    }
    
    func testPhraseWhenIsNotPalidrome() {
        let word = "amad aA dama"
        XCTAssertFalse(word.isPalindrome)
    }
    
    func testCharacterShouldNotBePalindrome() {
        let word = "a"
        XCTAssertFalse(word.isPalindrome)
    }
    
}

PalindromeTests.defaultTestSuite.run()
