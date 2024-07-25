import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        // First, try to find the test bundle
        guard let testBundle = findTestBundle() else {
            print("Could not find the test bundle")
            return nil
        }
        
        print("Test bundle path: \(testBundle.bundlePath)")
        
        // Try to find the SVG file within the test bundle
        if let svgData = findSVGFile(in: testBundle, folder: folder, name: name) {
            return svgData
        }
        
        print("Failed to find SVG file: \(name).svg in folder: \(folder)")
        return nil
    }
    
    private static func findTestBundle() -> Bundle? {
        let testBundleName = "cryptotokens-swift_cryptotokens-swift.bundle"
        
        // Check if we're running in a test environment
        if let testBundle = Bundle(identifier: "com.apple.dt.xctest.tool") {
            // Enumerate through the test bundle to find our specific bundle
            if let bundleURL = testBundle.url(forResource: testBundleName, withExtension: nil) {
                return Bundle(url: bundleURL)
            }
        }
        
        return nil
    }
    
    private static func findSVGFile(in bundle: Bundle, folder: String, name: String) -> Data? {
        let possiblePaths = [
            "\(name).svg",
            "\(folder)/\(name).svg",
            "Resources/\(folder)/\(name).svg"
        ]
        
        for path in possiblePaths {
            if let url = bundle.url(forResource: path, withExtension: nil) {
                print("Found SVG at: \(url)")
                do {
                    return try Data(contentsOf: url)
                } catch {
                    print("Error loading SVG data from \(url): \(error)")
                }
            }
        }
        
        return nil
    }
}