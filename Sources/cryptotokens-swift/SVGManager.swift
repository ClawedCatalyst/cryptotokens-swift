import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        let bundle = Bundle.module
        let resourcePath = "\(folder)/\(name).svg"

        print("Searching for resource: \(resourcePath)")

        if let resourceURLs = bundle.urls(forResourcesWithExtension: "svg", subdirectory: folder) {
            print("Available SVG resources in \(folder):")
            for url in resourceURLs {
                print(url)
            }
        } else {
            print("No SVG resources found in \(folder)")
        }

        guard let url = bundle.url(forResource: name, withExtension: "svg", subdirectory: folder) else {
            print("Resource URL not found for: \(resourcePath)")
            return nil
        }
        
        print("Loading SVG from URL: \(url)")
        return try? Data(contentsOf: url)
    }
}