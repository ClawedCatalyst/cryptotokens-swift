import Foundation

public struct SVGManager {
    public static func getSVG(from folder: String, named name: String) -> Data? {
        let bundle = Bundle.module
        let subdirectory = "Resources/\(folder)"

        // List available resources in the specified folder
        if let resourceURLs = bundle.urls(forResourcesWithExtension: "svg", subdirectory: subdirectory) {
            print("Available resources in \(folder):")
            for url in resourceURLs {
                print(url.lastPathComponent)
            }
        } else {
            print("No resources found in \(folder)")
        }

        // Construct the correct resource path
        guard let url = bundle.url(forResource: name, withExtension: "svg", subdirectory: subdirectory) else {
            print("Resource URL not found for \(name).svg in path: \(subdirectory)")
            return nil
        }

        print("Loading SVG from URL: \(url)")
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Error loading SVG data: \(error)")
            return nil
        }
    }
}