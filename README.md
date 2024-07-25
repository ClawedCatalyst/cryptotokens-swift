# Folder Structure.

```

cryptotokens-swift
├── Package.swift
├── README.md
├── Sources
│ └── cryptotokens-swift
│ └── Resources
│ ├── branded
│ │ ├── images1.svg
│ │ └── images2.svg
│ └── mono
│ ├── images1.svg
│ └── images2.svg
└── Tests
└── cryptotokens-swiftTests
└── cryptotokens-swiftTests.swift

```

# How to use.

```Swift
struct SVGView: UIViewRepresentable {
    var svgData: Data

    func makeUIView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(data: svgData)
        let imageView = SVGKFastImageView(svgkImage: svgImage)
        return imageView!
    }

    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        let svgImage = SVGKImage(data: svgData)
        uiView.image = svgImage
    }
}

```

```Swift
 if let svgData = SVGManager.getSVG(named: {{ticker symbol for coin}} ?? "nothing") {
                        SVGView(svgData: svgData)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
 }
```
