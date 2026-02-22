#!/usr/bin/env swift

import Foundation
import CoreGraphics
import ImageIO
import UniformTypeIdentifiers

let size = 1024
let scale: CGFloat = CGFloat(size)

guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB),
      let ctx = CGContext(
          data: nil,
          width: size,
          height: size,
          bitsPerComponent: 8,
          bytesPerRow: size * 4,
          space: colorSpace,
          bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
      ) else {
    print("Failed to create context")
    exit(1)
}

let center = CGPoint(x: scale / 2, y: scale / 2)

// Background: dark purple gradient
let bgColors: [CGFloat] = [
    0.04, 0.03, 0.12, 1.0,  // Deep dark purple
    0.08, 0.05, 0.20, 1.0,  // Slightly lighter purple
    0.15, 0.08, 0.25, 1.0,  // Medium purple at edges
]
let bgLocations: [CGFloat] = [0.0, 0.5, 1.0]

if let bgGradient = CGGradient(colorSpace: colorSpace, colorComponents: bgColors, locations: bgLocations, count: 3) {
    ctx.drawRadialGradient(
        bgGradient,
        startCenter: center,
        startRadius: 0,
        endCenter: center,
        endRadius: scale * 0.75,
        options: [.drawsAfterEndLocation]
    )
}

// Draw subtle glow behind the star
let glowColors: [CGFloat] = [
    0.79, 0.66, 0.30, 0.25,  // Gold glow center
    0.79, 0.66, 0.30, 0.08,  // Fading
    0.79, 0.66, 0.30, 0.0,   // Transparent
]
let glowLocations: [CGFloat] = [0.0, 0.4, 1.0]

if let glowGradient = CGGradient(colorSpace: colorSpace, colorComponents: glowColors, locations: glowLocations, count: 3) {
    ctx.drawRadialGradient(
        glowGradient,
        startCenter: center,
        startRadius: 0,
        endCenter: center,
        endRadius: scale * 0.45,
        options: []
    )
}

// Function to draw a star
func drawStar(ctx: CGContext, center: CGPoint, outerRadius: CGFloat, innerRadius: CGFloat, points: Int, rotation: CGFloat = -.pi / 2) {
    let path = CGMutablePath()
    let angleStep = .pi / CGFloat(points)

    for i in 0..<(points * 2) {
        let radius = i % 2 == 0 ? outerRadius : innerRadius
        let angle = rotation + angleStep * CGFloat(i)
        let point = CGPoint(
            x: center.x + radius * cos(angle),
            y: center.y + radius * sin(angle)
        )
        if i == 0 {
            path.move(to: point)
        } else {
            path.addLine(to: point)
        }
    }
    path.closeSubpath()
    ctx.addPath(path)
}

// Main 8-pointed star (gold)
ctx.saveGState()
drawStar(ctx: ctx, center: center, outerRadius: scale * 0.32, innerRadius: scale * 0.14, points: 8)
ctx.setFillColor(CGColor(red: 0.79, green: 0.66, blue: 0.30, alpha: 1.0))
ctx.fillPath()
ctx.restoreGState()

// Inner bright star
ctx.saveGState()
drawStar(ctx: ctx, center: center, outerRadius: scale * 0.18, innerRadius: scale * 0.10, points: 8, rotation: -.pi / 2 + .pi / 8)
ctx.setFillColor(CGColor(red: 0.90, green: 0.80, blue: 0.45, alpha: 1.0))
ctx.fillPath()
ctx.restoreGState()

// Center circle (bright)
ctx.saveGState()
ctx.setFillColor(CGColor(red: 0.95, green: 0.88, blue: 0.55, alpha: 1.0))
ctx.fillEllipse(in: CGRect(
    x: center.x - scale * 0.06,
    y: center.y - scale * 0.06,
    width: scale * 0.12,
    height: scale * 0.12
))
ctx.restoreGState()

// Small decorative stars (Big Dipper constellation pattern)
let smallStarPositions: [(CGFloat, CGFloat, CGFloat)] = [
    // Big Dipper pattern (scaled)
    (0.22, 0.18, 0.015),  // Star 1
    (0.30, 0.22, 0.012),  // Star 2
    (0.38, 0.20, 0.013),  // Star 3
    (0.45, 0.24, 0.011),  // Star 4
    (0.72, 0.78, 0.014),  // Star 5
    (0.78, 0.82, 0.012),  // Star 6
    (0.82, 0.75, 0.010),  // Star 7
    // Extra decorative stars
    (0.15, 0.72, 0.008),
    (0.85, 0.20, 0.009),
    (0.65, 0.15, 0.007),
    (0.20, 0.85, 0.008),
    (0.90, 0.55, 0.006),
    (0.10, 0.45, 0.007),
    (0.50, 0.88, 0.006),
    (0.75, 0.42, 0.005),
]

for (xRatio, yRatio, radiusRatio) in smallStarPositions {
    let pos = CGPoint(x: scale * xRatio, y: scale * yRatio)
    let r = scale * radiusRatio

    ctx.saveGState()
    drawStar(ctx: ctx, center: pos, outerRadius: r, innerRadius: r * 0.4, points: 4)
    ctx.setFillColor(CGColor(red: 0.90, green: 0.85, blue: 0.65, alpha: 0.8))
    ctx.fillPath()
    ctx.restoreGState()
}

// Draw thin connecting lines for Big Dipper (first 7 stars)
ctx.saveGState()
ctx.setStrokeColor(CGColor(red: 0.79, green: 0.66, blue: 0.30, alpha: 0.2))
ctx.setLineWidth(1.5)
let dipperStars = smallStarPositions.prefix(7).map { CGPoint(x: scale * $0.0, y: scale * $0.1) }
for i in 0..<(dipperStars.count - 1) {
    ctx.move(to: dipperStars[i])
    ctx.addLine(to: dipperStars[i + 1])
}
ctx.strokePath()
ctx.restoreGState()

// Save as PNG
guard let image = ctx.makeImage() else {
    print("Failed to create image")
    exit(1)
}

let outputPath = "/Users/daisakuharasaki/tarotto/Tarotto/Assets.xcassets/AppIcon.appiconset/AppIcon.png"
let url = URL(fileURLWithPath: outputPath)

guard let dest = CGImageDestinationCreateWithURL(url as CFURL, UTType.png.identifier as CFString, 1, nil) else {
    print("Failed to create image destination")
    exit(1)
}

CGImageDestinationAddImage(dest, image, nil)

if CGImageDestinationFinalize(dest) {
    print("Icon saved to: \(outputPath)")
} else {
    print("Failed to save icon")
    exit(1)
}
