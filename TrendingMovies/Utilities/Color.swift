//
//  Color.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import UIKit

struct Color {
    
    //PrimaryColors
    static let primary = UIColor(primaryColor)
    static let primaryLight = UIColor(primarLightColor)
    static let primaryDark = UIColor(primaryDarkColor)
    
    // Text
    static let blackText = UIColor(blackColor)
    static let darkText = UIColor(darkTextColor)
    static let mediumText = UIColor(mediumTextColor)
    static let lightText = UIColor(lightTextColor)
    static let veryLightText = UIColor(veryLightTextColor)
    static let errorText = UIColor(errorTextColor)
    
    static let separator = UIColor(separatorColor)
}

public extension UIColor {
    
    /// Must be in the format of #AARRGGBB or #RRGGBB
    convenience init(_ hexString: String) {
        
        if !(hexString.hasPrefix("#") && (hexString.count == 7 || hexString.count == 9)) {
            fatalError("Incorrect Hex String format")
        }
        
        let scanner = Scanner(string: hexString)
        // Skip #
        scanner.scanString("#", into: nil)
        
        var value: UInt32 = 0
        scanner.scanHexInt32(&value)
        
        var a: UInt32 = 0xFF
        if hexString.count == 9 {
            a = (value & 0xFF000000) >> 24
        }
        let r = (value & 0x00FF0000) >> 16
        let g = (value & 0x0000FF00) >> 8
        let b = (value & 0x000000FF) >> 0
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        let alpha = CGFloat(a) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func isLight() -> Bool {
        guard let components = cgColor.components else { return false }
        let redBrightness = components[0] * 299
        let greenBrightness = components[1] * 587
        let blueBrightness = components[2] * 114
        let brightness = (redBrightness + greenBrightness + blueBrightness) / 1000
        return brightness > 0.5
    }
}

public extension UIColor {
    
    var redValue: CGFloat { return CIColor(color: self).red }
    var greenValue: CGFloat { return CIColor(color: self).green }
    var blueValue: CGFloat { return CIColor(color: self).blue }
    var alphaValue: CGFloat { return CIColor(color: self).alpha }
}
