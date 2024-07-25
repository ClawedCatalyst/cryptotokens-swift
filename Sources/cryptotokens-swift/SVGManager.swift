import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        let bundle = Bundle.main  // Or Bundle.module if in a Swift Package
        print("Bundle path: \(bundle.bundlePath)")
        
        // Explore bundle contents
        exploreBundleContents(bundle)
        
        // Try to find the SVG file
        if let svgData = findSVGFile(in: bundle, folder: folder, name: name) {
            return svgData
        }
        
        print("Failed to find SVG file: \(name).svg in folder: \(folder)")
        return nil
    }
    
    private static func exploreBundleContents(_ bundle: Bundle) {
        let fileManager = FileManager.default
        guard let enumerator = fileManager.enumerator(atPath: bundle.bundlePath) else {
            print("Unable to create enumerator for bundle path")
            return
        }
        
        print("Bundle contents:")
        while let filePath = enumerator.nextObject() as? String {
            if filePath.hasSuffix(".svg") {
                print("  \(filePath)")
            }
        }
    }
    
    private static func findSVGFile(in bundle: Bundle, folder: String, name: String) -> Data? {
        let possiblePaths = [
            "\(folder)/\(name).svg",
            "Resources/\(folder)/\(name).svg",
            "\(name).svg"
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