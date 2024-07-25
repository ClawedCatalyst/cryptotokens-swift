import Foundation

public struct SVGManager {
    public static func getSVG(named name: String) -> Data? {
        let fileManager = FileManager.default
        
        // Construct the path to the SVG file
        let bundlePath = Bundle.main.bundlePath
        let svgPath = "\(bundlePath)/PlugIns/benefiTests.xctest/cryptotokens-swift_cryptotokens-swift.bundle/\(name).svg"
        
        // Check if the file exists
        guard fileManager.fileExists(atPath: svgPath) else {
            return nil
        }
        
        // Try to read the file data
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: svgPath))
            return data
        } catch {
            return nil
        }
    }
}