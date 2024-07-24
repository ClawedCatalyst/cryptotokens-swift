import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        let bundle = Bundle.module
        let resourcePath = "Resources/\(folder)/\(name).svg"

        if let resourceURLs = bundle.urls(forResourcesWithExtension: nil, subdirectory: "Resources/\(folder)") {
            print(resourceURLs)
            print("Available resources in \(folder):")
            for url in resourceURLs {
                print(url.lastPathComponent)
            }
        }

        guard let url = bundle.url(forResource: name, withExtension: "svg", subdirectory: resourcePath) else {
            print("Resource URL not found at path: \(resourcePath)")
            return nil
        }
        print("Loading SVG from URL: \(url)")
        return try? Data(contentsOf: url)
    }
}
