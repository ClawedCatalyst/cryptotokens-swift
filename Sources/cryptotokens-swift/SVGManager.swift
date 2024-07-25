import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        // Use Bundle.main instead of Bundle.module if this is not in a Swift Package
        let bundle = Bundle.main
        let subdirectory = "Resources/\(folder)"

        // Debug: Print the bundle path
        print("Bundle path: \(bundle.bundlePath)")

        // List available resources in the specified folder
        if let resourceURLs = bundle.urls(forResourcesWithExtension: "svg", subdirectory: subdirectory) {
            print("Available SVG resources in \(subdirectory):")
            for url in resourceURLs {
                print(url.lastPathComponent)
            }
        } else {
            print("No SVG resources found in \(subdirectory)")
        }

        // Try to locate the resource without specifying the subdirectory
        if let url = bundle.url(forResource: name, withExtension: "svg") {
            print("Found SVG at: \(url)")
            do {
                return try Data(contentsOf: url)
            } catch {
                print("Error loading SVG data: \(error)")
                return nil
            }
        }

        // If not found, try with the subdirectory
        if let url = bundle.url(forResource: name, withExtension: "svg", subdirectory: subdirectory) {
            print("Found SVG at: \(url)")
            do {
                return try Data(contentsOf: url)
            } catch {
                print("Error loading SVG data: \(error)")
                return nil
            }
        }

        print("Resource URL not found for \(name).svg in path: \(subdirectory)")
        return nil
    }
}