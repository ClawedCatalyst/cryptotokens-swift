import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        let bundle = Bundle.module
        let resourcePath = "Resources/\(folder)/\(name).svg"
        guard let url = bundle.url(forResource: name, subdirectory: "Resources/\(folder)") else {
            print("Resource URL not found at path: \(resourcePath)")
            return nil
        }
        print("Loading SVG from URL: \(url)")
        return try? Data(contentsOf: url)
    }
}
