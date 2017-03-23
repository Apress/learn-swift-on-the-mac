// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension UIColor {
    convenience init(rgba : UInt32) {
        let r = CGFloat(Double(rgba >> 24 & 0xFF) / 255.0)
        let g = CGFloat(Double(rgba >> 16 & 0xFF) / 255.0)
        let b = CGFloat(Double(rgba >> 8 & 0xFF) / 255.0)
        let a = CGFloat(Double(rgba & 0xFF) / 255.0)

        self.init(red: r, green: g, blue: b, alpha: a)
    }
        
    class func colorWithRGBAHex(rgba : UInt32) -> UIColor? {
        return UIColor(rgba: rgba)
    }
}

var color = UIColor(rgba: 0xff0000ff)
color = UIColor.colorWithRGBAHex(0x00ff00ff)!

extension UIColor {
    enum ErrorType : Int {
        case Normal, File, API
    }

    class func errorColor(errorType : ErrorType) -> UIColor? {
        var color : UIColor? = nil
        switch errorType {
        case .Normal:
            color = colorWithRGBAHex(0xff0000ff)
        case .File :
            color = colorWithRGBAHex(0xcc0000ff)
        case .API:
            color = colorWithRGBAHex(0xaa0000ff)
        }
        
        return color
    }
}

color = UIColor.errorColor(.API)!
color = UIColor.errorColor(.Normal)!
