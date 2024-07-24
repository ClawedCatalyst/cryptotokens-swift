import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        let bundle = Bundle.module
        guard let url = bundle.url(forResource: name, withExtension: "svg", subdirectory: "Resources/\(folder)") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
